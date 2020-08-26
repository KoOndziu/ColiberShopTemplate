/** 
 * 2019-2020 Konrad Kubala
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

/* global $ */
$(document).ready(function () {
  var $searchWidget = $('#search_widget');
  var $searchBox = $('.search-widget input[type=text]');
  var searchURL = $searchWidget.attr('data-search-controller-url');
  
  $.widget('prestashop.psBlockSearchAutocomplete', $.ui.autocomplete, {
    _renderItem: function (ul, product) {
      //console.log(product);
      return $("<li>")
              .append($("<a>").addClass("icon-diamond")
                      .append($("<span>").html(product.name).addClass("product"))
                      ).appendTo(ul)
              ;
    },
    _resizeMenu: function () {
      console.log(this);
      var ul = this.menu.element;
      ul.addClass('list');
      ul.outerWidth(this.element.parent().outerWidth());
    }
  });
  $searchBox.psBlockSearchAutocomplete({
    source: function (query, response) {
      $.post(searchURL, {
        s: query.term,
        resultsPerPage: 5
      }, null, 'json')
              .then(function (resp) {
                response(resp.products);
              })
              .fail(response);
    },
    select: function (event, ui) {
      var url = ui.item.url;
      window.location.href = url;
    }
  });
});
