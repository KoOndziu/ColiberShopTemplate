{** 
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
 *}

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
