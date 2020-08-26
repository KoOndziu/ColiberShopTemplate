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
