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
