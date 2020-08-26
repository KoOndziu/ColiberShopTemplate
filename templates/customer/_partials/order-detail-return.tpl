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
	
  <form 
		id="order-return-form"
		class="form-normal"
		action="{$urls.pages.order_follow}" 
		method="post">
		
		<h2>{l s='Merchandise return' d='Shop.Theme.Customeraccount'}</h2>
		<p>
			{l 
				s='If you wish to return one or more products, please mark the corresponding boxes and provide an explanation for the return. When complete, click the button below.' 
				d='Shop.Theme.Customeraccount'
			}
			<ul>
				<li>
					{l
						s='Your package must be returned to us within %number% days of receiving your order.'
						d='Shop.Theme.Customeraccount'
						sprintf=['%number%' => $configuration.number_of_days_for_return]
					}
				</li>
				<li>
					{l
						s='All products must be returned in their original package and condition, unused and without damage.'
						d='Shop.Pdf'
					}
				</li>
			</ul>
		</p>
		<div class="input-text">
			<textarea 
				id="returnText" 
				rows="1" 
				name="returnText"
				placeholder="{{l s='Please provide an explanation for your RMA.' d='Shop.Notifications.Error'}|replace:'.':''}"
			></textarea>
			<input type="hidden" name="id_order" value="{$order.details.id}">
			<button 
				class="icon-loop"
				type="submit" 
				name="submitReturnMerchandise"
				title="{l s='Request a return' d='Shop.Theme.Customeraccount'}"
			></button>
		</div>
		
		<h2>{l s='Order items' d='Shop.Theme.Checkout'}</h2>
		<ul id="order-products" class="cart-overview">
			{foreach from=$order.products item=product}
				<li>
					{include file='catalog/_partials/miniatures/product-line.tpl' product=$product checkbox=yes}
					{block name='product_line_actions'}
						<section class="product-actions">
							<section title="{l s='Quantity' d='Shop.Theme.Catalog'}">
								{if !$product.customizedDatas}
									<input 
										type="number" 
										name="order_qte_input[{$product.id_order_detail}]"
										min="0"
										max="{$product.product_quantity-$product.qty_returned}"
										value="{$product.quantity-$product.qty_returned}"
									>
								{else}
									{foreach $product.customizations as $customization}
										<input
											type="number"
											name="customization_qty_input[{$customization.id_customization}]"
											min="0"
											max="{$customization.quantity}"
											value="{$customization.quantity}"
										>
									{/foreach}
								{/if}
							</section>
							<section
								class="icon-loop"
								title="{l s='Returned' d='Shop.Theme.Catalog'}"
								>{$product.qty_returned}
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
  </form>
{/block}
