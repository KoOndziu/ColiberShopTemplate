{block name='cart_detailed_totals'}
	<section class="cart-detailed-totals">
    {if !empty($cart.products)}
      {include file='checkout/_partials/totals.tpl' 
        subtotals=$cart.subtotals 
        totals=$cart.totals
      }
    {else}
      <p 
        class="cart-is-empty icon-ghost extender"
        >{l s='There are no more items in your cart' d='Shop.Theme.Checkout'}.
      </p>
    {/if}
	</section>
{/block}