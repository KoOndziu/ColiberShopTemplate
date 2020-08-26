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

{block name='cart_detailed'}
  <ul 
		class="cart-overview js-cart" 
		data-refresh-url="{url entity='cart' params=['ajax' => 1, 'action' => 'refresh']}"
	>
		{foreach from=$cart.products item=product}
      <li>
				{include file='catalog/_partials/miniatures/product-line.tpl' product=$product}
				{block name='product_line_actions'}
					<section class="product-actions">
						<section class="product-quantity">
							{if isset($product.is_gift) && $product.is_gift}
								<span class="gift-quantity">{$product.quantity}</span>
							{else}

									<input
										class="js-cart-line-product-quantity"
                    data-action="updateProductQuantity"
                    data-url="{$product.update_quantity_url}"
										data-down-url="{$product.down_quantity_url}"
										data-up-url="{$product.up_quantity_url}"
										data-product-id="{$product.id_product}"
										type="number"
										value="{$product.quantity}"
										name="product-quantity-spin"
										min="{$product.minimal_quantity}"
									>
							{/if}
						</section>

						<section class="product-price">
							{if isset($product.is_gift) && $product.is_gift}
								<span class="gift icon-present">{l s='Gift' d='Shop.Theme.Checkout'}</span>
							{else}
								<span class="icon-wallet">{$product.total}</span>
							{/if}
						</section>

						<section>
							{block name='hook_cart_extra_product_actions'}
								{hook h='displayCartExtraProductActions' product=$product}
							{/block}

							<a
								class="button delete-from-cart icon-trash"
								data-action="deleteFromCart"
								data-id-product="{$product.id_product|escape:'javascript'}"
								data-id-product-attribute="{$product.id_product_attribute|escape:'javascript'}"
								href="{$product.remove_from_cart_url}"
								rel="nofollow"
								title="{l s='Remove' d='Shop.Theme.Actions'}"
							 ></a>
						</section>
					</section>
				{/block}
			</li>
    {/foreach}
  </ul>
{/block}
