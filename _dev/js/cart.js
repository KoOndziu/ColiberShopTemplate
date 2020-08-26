/** 
 * 2019-2020 Konrad Kubala <000konrad000@gmail.com>
 * 
 * NOTICE OF LICENSE
 * 
 * This source file is subject to the AFL-3.0
 * that is bundled with this package in the file LICENSE.txt.
 * 
 * @author    Konrad Kubala <000konrad000@gmail.com>
 * @copyright 2007-26 sie 2020 Konrad Kubala <000konrad000@gmail.com>
 * @license   AFL-3.0
 */

import $ from 'jquery';
import prestashop from 'prestashop';
import Utils from './components/utils';
import Ajax from './components/ajax';

const selectors = {
  cartCount: '.js-cart-count',
  checkoutButton: '.js-checkout-button', 
  addToCartButton: 'button.add-to-cart',
  clickAction: 'button[data-action], a[data-action]',
  changeAction: 'input[type=number][data-action]',
  submitAction: 'form[data-action]'
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
    let data = {
      ajax: '1',
      action: 'update'
    };
    
    if ($target.context.localName === 'form') {
      Object.assign(data, objectifyForm($target));
    } else if (action === 'updateProductQuantity') {
      let quantity = getQtyDiff($target);
      Object.assign(data, {
        qty: Math.abs(quantity),
        op: (quantity > 0) ? 'up' : 'down'
      });
    } else if (action === 'addDiscount') {
      Object.assign(data, {
        addDiscount: 1,
        token: $target.data('token'),
        discount_name: $target.data('code')
      });
    }
    
    console.log(data);
    return data;
  }
  
  function objectifyForm($target) {
    let formArray = $target.serializeArray();
    let formObject = {};
    for (let i in formArray){
      formObject[formArray[i]['name']] = formArray[i]['value'];
    }
    return formObject;
  }

  function parseAction($target) {
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
    }).then((resp) => {
      CheckUpdateQuantityOperations.checkUpdateOpertation(resp);
      
      if(!hasError) {
        prestashop.emit('updateCart', { reason: resp });
        $target.val(resp.quantity);
      } else {
        prestashop.emit('handleError', {eventType: 'updateProductQuantityInCart', resp: resp});
      }
      
      console.log(resp);
    }).fail((resp) => {
      console.log(resp);
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
    let cartAction = parseAction($target);
    let requestData = parseRequestData($target, cartAction.type);

    return sendCartRequest(cartAction, requestData, $target);
    //return ajax.sendRequest(cartAction, requestData);
  };
  
  let handleUpdateCartEvent = (event) => {
    let productsCount = event.reason.cart.products_count;
    let cartCount = $(selectors.cartCount);
    let checkoutButton = $(selectors.checkoutButton);
    let addToCartButton = $(selectors.addToCartButton);
    let quickView = $('.quickview');
    
    Utils.isLoad('.js-cart');
    cartCount.attr('data-cart-count', productsCount);
    quickView.modal('hide');
    addToCartButton.removeClass('icon-basket');
    addToCartButton.addClass('icon-basket-loaded');
    document.activeElement.blur();
    
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
    document.activeElement.blur();
    Utils.isLoaded('.js-cart');
    CheckUpdateQuantityOperations.switchErrorStat();
  };
  
  prestashop.on('updateCart', handleUpdateCartEvent);
  prestashop.on('updatedCart', handleUpdatedCartEvent);
  prestashop.on('handleError', handleError);

  body.on('click',  selectors.clickAction,  handleCartAction);
  body.on('change', selectors.changeAction, handleCartAction);
  // nie działają błędy formularzy :(
  //body.on('submit', selectors.formAction,   handleCartAction);
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
      let strError = '<ul class="notifications"><li role="alert" data-alert="danger" class="notification-danger"><div><i class="icon-close"></i><div>' + errorMsg + '</div><button class="icon-close"></button></div></li></ul>';
      $('#notifications').html(strError);
      errorMsg = '';
      isUpdateOperation = false;
      if (hasError) {
        // if hasError is true, quantity was not updated : allow checkout
        $checkoutBtn.removeClass('disabled');
      }
    } else if (!hasError && isUpdateOperation) {
      hasError = false;
      isUpdateOperation = false;
      $('#notifications').html('');
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
