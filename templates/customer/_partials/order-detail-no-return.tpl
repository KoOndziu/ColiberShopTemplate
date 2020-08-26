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

{block name='order_products_table'}
	
	<ul id="order-products" class="cart-overview">
		{foreach from=$order.products item=product}
			<li>
				{include file='catalog/_partials/miniatures/product-line.tpl' product=$product}
				{block name='product_line_actions'}
					<section class="product-actions">
						<section title="{l s='Quantity' d='Shop.Theme.Catalog'}">
							{if $product.customizations}
								{foreach $product.customizations  as $customization}
									{$customization.quantity}
								{/foreach}
							{else}
								{$product.quantity}
							{/if}
						</section>
						<section 
							class="icon-pie-chart"
							title="{l s='Unit price' d='Shop.Theme.Catalog'}"
							>{$product.price}
						</section>
						<section 
							class="icon-wallet"
							title="{l s='Total price' d='Shop.Theme.Catalog'}"
							>{$product.total}
						</section>
					</section>
				{/block}
			</li>
		{/foreach}
	</ul>
				
{/block}
