<section id="order-summary-content" class="page-content page-order-confirmation">
	<header class="h2">{l s='Your order' d='Shop.Theme.Customeraccount'}</header>
  
  {block name='cart_summary'}
    {include file='checkout/_partials/cart-summary.tpl' cart=$cart}
  {/block}
</section>
