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

<section id="order_detail">
	<h2>{l s='Order details' d='Shop.Theme.Customeraccount'}</h2>

	<div class="grid">
		{block name='payment'}
			<article>
				<header>
					<span class="h2">{l s='Payment' d='Shop.Theme.Checkout'}</span>
				</header>
				<div 
					class="icon-wallet"
					title="{l s='Payment method' d='Shop.Theme.Checkout'}"
					>{$order.details.payment}
				</div>

				{if $order.details.invoice_url}
					<a 
						href="{$order.details.invoice_url}"
						class="icon-doc"
						>{l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}</a>
				{/if}
			</article>
		{/block}
		
		{block name='delivery'}
			<article>
				<header>
					<span class="h2">{l s='Delivery' d='Shop.Pdf'}</span>
				</header>
				{if $order.details.recyclable}
					<div
						class="icon-bag"
						>{l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}</div>
				{/if}
				<div 
					class="icon-plane"
					title="{l s='Carrier' d='Shop.Theme.Checkout'}"
				>
					{if $order.shipping|count == 1}
						{foreach from=$order.shipping item=line}
							<span title="{l s='Carrier' d='Shop.Theme.Checkout'}">{$order.carrier.name}</span><br>
							<span title="{l s='Date' d='Shop.Theme.Global'}">{$line.shipping_date}</span><br>
							<span title="{l s='Shipping cost' d='Shop.Theme.Checkout'}">{$line.shipping_cost}</span><br>
							<span>{l s='Weight' d='Shop.Theme.Checkout'}: {$line.shipping_weight}</span><br>
							<span>{l s='Tracking number' d='Shop.Theme.Checkout'}: {$line.tracking nofilter}</span>
						{/foreach}
					{/if}
				</div>
				
				{if $order.follow_up}
					<a 
						href="{$order.follow_up}" 
						target="_blank"
						class="icon-target"
						>{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</a>
				{/if}
			</article>
		{/block}
		
		{block name='addresses'}
			{if $order.addresses.delivery}
				<article id="delivery-address" class="address">
					<header>
						<span class="h2">{l s='Delivery address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.delivery.alias]}</span>
					</header>
					<p>{$order.addresses.delivery.formatted nofilter}</p>
				</article>
			{/if}
			<article id="invoice-address" class="address">
				<header>
					<span class="h2">{l s='Invoice address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.invoice.alias]}</span>
				</header>

				<p>{$order.addresses.invoice.formatted nofilter}</p>
			</article>
		{/block}
		
		{block name='gift'}
			{if $order.details.gift_message}
				<article style="grid-column: 1 / 5">
					<header>
						<span class="h2">{l s='Gift' d='Shop.Theme.Checkout'}</span>
					</header>
					<div
						class="icon-present"
						>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}</div>
					<div
						class="icon-envelope-letter"
						title="{l s='Message' d='Shop.Theme.Customeraccount'}"
						>"{$order.details.gift_message nofilter}"</div>
				</article>
			{/if}
		{/block}
	</div>

	{* You cannot return merchandise with a guest account. *}
	{if $customer.is_logged && $order.details.is_returnable}
		{include file='customer/_partials/order-detail-return.tpl'}
	{else}
		{include file='customer/_partials/order-detail-no-return.tpl'}
	{/if}

	{include file='checkout/_partials/totals.tpl' 
		subtotals=$order.subtotals 
		totals=$order.totals
	}
</section>