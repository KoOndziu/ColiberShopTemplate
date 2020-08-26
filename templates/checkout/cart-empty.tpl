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

{extends file='page.tpl'}

{block name='page_content'}
  <section>

		{block name='content'}
			{hook h='displayCrossSellingShoppingCart'}
		{/block}

		{block name='cart_overview'}
			<p 
				class="cart-is-empty icon-ghost extender"
				>{l s='There are no more items in your cart' d='Shop.Theme.Checkout'}.
			</p>
		{/block}

		{block name='cart_detailed_actions'}
			{include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
		{/block}
  </section>

{/block}


