{extends file='page.tpl'}

{block name='page_content'}
  <section>

    {block name='cart_overview'}
      {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
    {/block}
    
    {block name='cart_voucher'}
      {include file='checkout/_partials/cart-voucher.tpl'}
    {/block}

    {block name='hook_shopping_cart_footer'}
      {hook h='displayShoppingCartFooter'}
    {/block}

    {block name='cart_summary'}
			
      {block name='hook_shopping_cart'}
        {hook h='displayShoppingCart'}
      {/block}

			{* !important *}
      {block name='cart_detailed_totals'}
				{include file='checkout/_partials/cart-detailed-totals.tpl'}
      {/block}
			
			{* !important *}
			{block name='cart_detailed_actions'}
				{include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
			{/block}

    {/block}

    {block name='hook_reassurance'}
      {hook h='displayReassurance'}
    {/block}

  </section>

{/block}
