{block name='checkout_product_list'}
  <div id='order-items'>

    <h2>{l s='Order items' d='Shop.Theme.Checkout'}</h2>
		<ul class="cart-overview">
			{foreach from=$products item=product}
				<li>
					{include file='catalog/_partials/miniatures/product-line.tpl'}
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
								<span>{hook h='displayProductPriceBlock' product=$product type="unit_price"}</span>
							</section>
						</section>
					{/block}
				</li>
			{/foreach}
		</ul>

		{include file='checkout/_partials/totals.tpl'	
			subtotals=$subtotals 
			totals=$totals
		}

  </div>
{/block}
