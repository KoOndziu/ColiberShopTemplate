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
import Utils from './components/utils';

$(document).ready(function () {
  
  prestashop.on('updatedProduct', function (event) {
    if (event && event.product_minimal_quantity) {
      const minimalProductQuantity = parseInt(event.product_minimal_quantity, 10);
      const quantityInputSelector = '#quantity_wanted';
      let quantityInput = $(quantityInputSelector);
      quantityInput.trigger('touchspin.updatesettings', {min: minimalProductQuantity});
    }
    $($('.tabs .nav-link.active').attr('href')).addClass('active').removeClass('fade');
    $('.js-product-images-modal').replaceWith(event.product_images_modal);
  });

  $('body').on('change keyup', '#quantity_wanted', (e) => {
    $(e.currentTarget).trigger('touchspin.stopspin');
    prestashop.emit('updateProduct', {
      eventType: 'updatedProductQuantity',
      event: e
    });
  });

});

$(document).on('shown.bs.modal', '#product-modal', function (e) {
  $('#js-slick-product').resize();
});

//add to cart loader
$(document).on('click', '.js-add-to-cart:enabled:not(.is--loading)', function () {
  Utils.isLoad(this);
  $(this).attr("disabled", true);
});
prestashop.on('updateCart', function (event) {
  Utils.isLoaded('.js-add-to-cart');
});
prestashop.on('handleError', function (event) {
  Utils.isLoaded('.js-add-to-cart');
  $('.js-add-to-cart').attr("disabled", false);
});