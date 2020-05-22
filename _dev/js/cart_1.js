import $ from 'jquery';
import prestashop from 'prestashop';
import Utils from './components/utils';
import Ajax from './components/ajax';

const selectors = {
  discount: '[name=discount_name]',
  discountCode: '.js-discount .code',
  cartAction: '[data-action="deleteFromCart"], [data-action="removeVoucher"]',
  cartProductLine: '.js-cart-line-product-quantity',
  cartCount: '.js-cart-count',
  checkoutButton: '.js-checkout-button'
};
const body = $('body');
const promises = [];
const ajax = new Ajax();

let hasError = false;
let isUpdateOperation = false;
let errorMsg = '';

prestashop.cart = prestashop.cart || {};
prestashop.cart.active_inputs = null;

$(document).ready(() => {
  
  function getQtyDiff($target)
  {
    const baseValue = $target.attr('value');
    const targetValue = $target.val();

    if (  targetValue != parseInt(targetValue) || 
          targetValue <= 0 || 
          isNaN(targetValue)) {
      $target.val(baseValue);
    } else {
      $target.attr('value', targetValue);
    }
    
    return targetValue - baseValue;
  }
  
  function parseRequestData($target, action) {
    if (action === 'updateProductQuantity') {
      let quantity = getQtyDiff($target);
      return {
        ajax: '1',
        qty: Math.abs(quantity),
        action: 'update',
        op: (quantity > 0) ? 'up' : 'down'
      };
    } else {
      return {
        ajax: '1',
        action: 'update'
      };
    }
  }

  function parseCartAction($target) {
    return {
      url: $target.attr('href') || $target.data('url'),
      type: $target.data('action')
    };
  }

  function sendCartRequest(cartAction, requestData, $target) 
  {
    abortPreviousRequests();

    return $.ajax({
      url: cartAction.url,
      method: 'POST',
      data: requestData,
      dataType: 'json',
      beforeSend: (jqXHR) => { promises.push(jqXHR); }
    }).then(function (response) {
      CheckUpdateQuantityOperations.checkUpdateOpertation(response);
      $target.val(response.quantity);
      prestashop.emit('updateCart', { reason: response });
    }).fail((resp) => {
      prestashop.emit('handleError', {eventType: 'updateProductQuantityInCart', resp: resp});
    });
  }
  
  let abortPreviousRequests = () => {
    var promise;
    while (promises.length > 0) {
      promise = promises.pop();
      promise.abort();
    }
  };
  
  let handleCartAction = (event) => {
    event.preventDefault();

    let $target = $(event.currentTarget);
    let cartAction = parseCartAction($target);
    let requestData = parseRequestData($target, cartAction.type);

    if (typeof cartAction !== 'undefined') {
      return sendCartRequest(cartAction, requestData, $target);
    }
  };
  
  let handleApplyDiscount = (event) => {
    event.stopPropagation();
    $(selectors.discount).val( $(event.currentTarget).text() );
  };
  
  let handleUpdateCartEvent = (event) => {
    let productsCount = event.reason.cart.products_count;
    let cartCount = $(selectors.cartCount);
    let checkoutButton = $(selectors.checkoutButton);
    let quickView = $('.quickview');
    
    Utils.isLoad('.js-cart');
    cartCount.attr('data-cart-count', productsCount);
    quickView.modal('hide');
    
    if (productsCount) {
      checkoutButton.removeClass('disabled');
    } else {
      checkoutButton.addClass('disabled');
    }
  };
  
  let handleUpdatedCartEvent = () => {
    Utils.createSpin();
    Utils.isLoaded('.js-cart');
  };
  
  let handleError = () => {
    Utils.isLoaded('.js-cart');
  };
  
  prestashop.on('updateCart', handleUpdateCartEvent);
  prestashop.on('updatedCart', handleUpdatedCartEvent);
  prestashop.on('handleError', handleError);

  body.on('click', selectors.discountCode, handleApplyDiscount);
  body.on('click', selectors.cartAction, handleCartAction);
  body.on('change', selectors.cartProductLine, handleCartAction);
});

const CheckUpdateQuantityOperations = {
  'switchErrorStat': () => {
    /**
     * resp.hasError can be not defined but resp.errors not empty: quantity is updated but order cannot be placed
     * when resp.hasError=true, quantity is not updated
     */
    const $checkoutBtn = $('.checkout a, js-checkout-button');
    if ($("#notifications article.alert-danger").length || ('' !== errorMsg && !hasError)) {
      $checkoutBtn.addClass('disabled');
    }

    if ('' !== errorMsg) {
      let strError = ' <article class="alert alert-danger" role="alert" data-alert="danger"><ul><li>' + errorMsg + '</li></ul></article>';
      $('#notifications.notifications-container').html(strError);
      errorMsg = '';
      isUpdateOperation = false;
      if (hasError) {
        // if hasError is true, quantity was not updated : allow checkout
        $checkoutBtn.removeClass('disabled');
      }
    } else if (!hasError && isUpdateOperation) {
      hasError = false;
      isUpdateOperation = false;
      $('#notifications.notifications-container').html('');
      $checkoutBtn.removeClass('disabled');
    }
  },
  'checkUpdateOpertation': (resp) => {
    /**
     * resp.hasError can be not defined but resp.errors not empty: quantity is updated but order cannot be placed
     * when resp.hasError=true, quantity is not updated
     */
    hasError = resp.hasOwnProperty('hasError');
    let errors = resp.errors || "";
    // 1.7.2.x returns errors as string, 1.7.3.x returns array
    if (errors instanceof Array) {
      errorMsg = errors.join(" ");
    } else {
      errorMsg = errors;
    }

    isUpdateOperation = true;
  }
};
