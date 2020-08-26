/** 
 * 2019-2020 Konrad Kubala <000konrad000@gmail.com>
 * 
 * NOTICE OF LICENSE
 * 
 * This source file is subject to the AFL-3.0
 * that is bundled with this package in the file LICENSE.txt.
 * 
 * @author    Konrad Kubala <000konrad000@gmail.com>
 * @copyright 2007-2020 Konrad Kubala <000konrad000@gmail.com>
 * @license   AFL-3.0
 */

import $ from 'jquery';
import prestashop from 'prestashop';
import SlickSlider from "./components/slick";
import Utils from './components/utils';


$(document).ready(() => {
  prestashop.on('clickQuickView', (elm) => {
    let data = {
      'action': 'quickview',
      'id_product': elm.dataset.idProduct,
      'id_product_attribute': elm.dataset.idProductAttribute
    };
    $.post(prestashop.urls.pages.product, data, null, 'json').then(function (resp) {
      $('body').append(resp.quickview_html);
      let productModal = $(`#quickview-modal-${resp.product.id}-${resp.product.id_product_attribute}`);
      Utils.createSpin();
      productModal.modal('show');

      productModal.on('hidden.bs.modal', function () {
        productModal.remove();
      });
      productModal.on('shown.bs.modal', function () {
        productConfig(productModal);
      });
    }).fail((resp) => {
      prestashop.emit('handleError', {eventType: 'clickQuickView', resp: resp});
    });
  });

  var productConfig = (qv) => {
    let slickSlider = new SlickSlider();
    slickSlider.init();
  };

  const parseSearchUrl = function (event) {
    if (event.target.dataset.searchUrl !== undefined) {
      return event.target.dataset.searchUrl;
    }

    if ($(event.target).parent()[0].dataset.searchUrl === undefined) {
      throw new Error('Can not parse search URL');
    }

    return $(event.target).parent()[0].dataset.searchUrl;
  };
  
  
  $('body').on('click', '.js-search-filters-clear-all', function (event) {
    addLoadingClassProductList();
    prestashop.emit('updateFacets', parseSearchUrl(event));
  });
  $('body').on('click', '.js-search-link', function (event) {
    event.preventDefault();
    addLoadingClassProductList();
    prestashop.emit('updateFacets', $(event.target).closest('a').get(0).href);
  });

  $('body').on('change', '#search_filters select', function () {
    addLoadingClassProductList();
    prestashop.emit('updateFacets', $(this).val());
  });
  $('body').on('change', '#search_filters input[data-search-url]', function (event) {
    event.preventDefault();
    addLoadingClassProductList();
    prestashop.emit('updateFacets', parseSearchUrl(event));
  });
  
  $('body').on('change','#select-sort-order', function () {
    addLoadingClassProductList();
    prestashop.emit('updateFacets', $(this).val());
    $('#sort-orders-modal').modal('hide');
  });

  prestashop.on('updateProductList', (data) => {
    updateProductListDOM(data);
    removeLoadingClassProductList();
  });
});

function updateProductListDOM (data) {
  $('#search_filters').replaceWith(data.rendered_facets);
  $('#js-active-search-filters').replaceWith(data.rendered_active_filters);
  $('#js-product-list-top').replaceWith(data.rendered_products_top);
  $('#js-product-list').replaceWith(data.rendered_products);
  $('#js-product-list-bottom').replaceWith(data.rendered_products_bottom);
  if (typeof(data.rendered_products_header) !== 'undefined' && data.rendered_products_header) {
      $('#js-product-list-header').replaceWith(data.rendered_products_header);
  }
}

function addLoadingClassProductList() {
  $('#ps-facetedsearch-modal .modal-body').addClass('is--loading');
  $('#js-product-list-container').addClass('is--loading');
}

function removeLoadingClassProductList() {
  $('#ps-facetedsearch-modal .modal-body').removeClass('is--loading');
  $('#js-product-list-container').removeClass('is--loading');
}
