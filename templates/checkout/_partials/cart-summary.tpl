<section 
	id="js-checkout-summary" 
	class="js-cart js-checkout-summary"
	data-refresh-url="{url entity='cart' params=['ajax' => 1]}"
>

  {block name='summary_checkout_product_list'}
    <div id="cart-summary-product-list">
      <ul class="cart-overview">
        {foreach from=$cart.products item=product}
          <li>
						{include file='catalog/_partials/miniatures/product-line.tpl' product=$product}
						{block name='product_line_actions'}
							<section class="product-actions">
								<section class="product-quantity">
									<span>{$product.quantity}</span>
								</section>

								<section class="product-price">
									{if isset($product.is_gift) && $product.is_gift}
										<span class="gift icon-present">{l s='Gift' d='Shop.Theme.Checkout'}</span>
									{else}
										<span class="icon-wallet">{$product.total}</span>
									{/if}
								</section>
							</section>
						{/block}
					</li>
        {/foreach}
      </ul>
    </div>
  {/block}

  {block name='summary_checkout_totals'}
    {include file='checkout/_partials/totals.tpl' 
			subtotals=$cart.subtotals 
			totals=$cart.totals
		}
  {/block}
</section>
