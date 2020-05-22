<div class="cart-preview">
  <a	
    class="button icon-basket cart-button js-open-modal js-cart-count"
    href="{$cart_url}" 
    data-cart-count="{$cart.products_count}"
    data-refresh-url="{$refresh_url}"
    rel="nofollow" 
    title="{l s='Cart' d='Shop.Theme.Actions'}" 
  ></a>
  {include file='module:ps_shoppingcart/ps_shoppingcart_modal.tpl'}
</div>