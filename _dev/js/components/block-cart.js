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

import prestashop from 'prestashop';
import $ from 'jquery';

prestashop.blockcart = prestashop.blockcart || {};

prestashop.blockcart.showModal = (html) => {
  function getBlockCartModal() {
    return $('#blockcart-modal');
  }

  let $blockCartModal = getBlockCartModal();
  if ($blockCartModal.length){
    $blockCartModal.remove();
  }

  $('body').append(html);

  $blockCartModal = getBlockCartModal();
  $('#ps-shoppingcart-modal').modal('hide');
  $blockCartModal.modal('show').on('hidden.bs.modal', (event) => {
    prestashop.emit('updateProduct', {
      reason: event.currentTarget.dataset,
      event: event
    });
  });
};

