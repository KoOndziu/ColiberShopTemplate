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


