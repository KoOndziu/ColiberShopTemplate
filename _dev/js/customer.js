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

// do poprawki w kodzie tpl
function initRmaItemSelector() {
  $('#order-return-form table thead input[type=checkbox]').on('click', function() {
    var checked = $(this).prop('checked');
    $('#order-return-form table tbody input[type=checkbox]').each(function(_, checkbox) {
      $(checkbox).prop('checked', checked);
    });
  });
}

function setupCustomerScripts() {
  if ($('body#order-detail')) {
    initRmaItemSelector();
  }
}

$(document).ready(setupCustomerScripts);
