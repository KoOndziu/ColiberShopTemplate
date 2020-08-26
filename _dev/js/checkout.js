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

function setUpCheckout() {

  $('body').on('click', '.js-terms a', (event) => {
    event.preventDefault();
    Utils.isLoad('#modal .modal-body .js-modal-content');
    
    var url = $(event.target).attr('href');
    if (url) {
      // TODO: Handle request if no pretty URL
      url += `?content_only=1`;
      $.get(url, (content) => {
        $('#modal').find('.js-modal-content').html($(content).find('.page-content--cms').contents());
        Utils.isLoaded('#modal .modal-body .js-modal-content');
      }).fail((resp) => {
        prestashop.emit('handleError', {eventType: 'clickTerms', resp: resp});
      });
    }

    $('#modal').modal('show');
  });

  $('.js-gift-checkbox').on('click', (event) => {
    $('#gift').slideToggle();
  });
}

$(document).ready(() => {
  if ($('body#checkout').length === 1) {
    setUpCheckout();
  }

  prestashop.on('updatedDeliveryForm', (params) => {
    if (typeof params.deliveryOption === 'undefined' || 0 === params.deliveryOption.length) {
        return;
    }
    // Hide all carrier extra content ...
    $(".carrier-extra-content").slideUp();
    // and show the one related to the selected carrier
    params.deliveryOption.next(".carrier-extra-content").slideDown();
  });
  prestashop.on('changedCheckoutStep', (params) => {
    if(typeof params.event.currentTarget !== 'undefined'){
        $('.collapse',params.event.currentTarget).not('.show').not('.collapse .collapse').collapse('show');
    }
  });
  
  $(document).on('click','.js-checkout-step-header', (event) => {
    let stepIdentifier = $(event.currentTarget).attr('id');
    $('#'+stepIdentifier).addClass('-current');
    $('#content-'+stepIdentifier).collapse('show').scrollTop();
    /*$('html, body').animate({
      scrollTop: $(event.currentTarget).offset().top
    }, 2000);*/
  });
  $(document).on('change','.js-input-delivery:checked', (event) => {
    $('.js-label-delivery.selected').removeClass('selected');
    $('#js-'+$(this).attr('id')).addClass('selected');
  });

});


