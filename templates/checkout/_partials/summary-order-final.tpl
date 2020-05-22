<section id="order-summary-content" class="page-content page-order-confirmation">
	{block name='order_confirmation_table'}
		{include file='checkout/_partials/totals.tpl' 
			subtotals=$cart.subtotals 
			totals=$cart.totals
		}
	{/block}
</section>
