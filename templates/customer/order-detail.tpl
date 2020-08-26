{extends file='page.tpl'}

{block name='page_title'}
  {l s='Order' d='Shop.Theme.Customeraccount'} {$order.details.reference}
{/block}

{block name='page_content'}
	
	{block name='order_history'}
    <section id="order-history">
			
			<p class="icon-bag extender">
				{l
					s='Order Reference %reference% - placed on %date%'
					d='Shop.Theme.Customeraccount'
					sprintf=['%reference%' => $order.details.reference, '%date%' => $order.details.order_date]
				}.

				<ul class="list list-center">
					{if $order.details.reorder_url}
						<li><a href="{$order.details.reorder_url}" class="icon-reload">{l s='Reorder' d='Shop.Theme.Actions'}</a></li>
					{/if}
					{if $order.follow_up}
						<li><a href="{$order.follow_up}" target="_blank" class="icon-target" >{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</a></li>
					{/if}
					{if $order.details.invoice_url}
						<li><a href="{$order.details.invoice_url}" class="icon-doc">{l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}</a></li>
					{/if}
				</ul>
			</p>
      
      {$HOOK_DISPLAYORDERDETAIL nofilter}
			
      <h2>{l s='Follow your order\'s status step-by-step' d='Shop.Theme.Customeraccount'}</h2>
      <dl>
				{foreach from=$order.history item=state}
					<dt title="{l s='Status' d='Shop.Theme.Checkout'}">
						<i class="order-status-color" style="background:{$state.color}"></i><span class="order-status-label {$state.contrast}">{$state.ostate_name}</span>
					</dt>
					<dd title="{l s='Date' d='Shop.Theme.Checkout'}">{$state.history_date}</dd>
				{/foreach}
      </dl>
				
			{block name='order_carriers'}
				{if $order.shipping|count > 1}
					<table>
						<thead>
							<tr>
								<th>{l s='Date' d='Shop.Theme.Global'}</th>
								<th>{l s='Carrier' d='Shop.Theme.Checkout'}</th>
								<th>{l s='Weight' d='Shop.Theme.Checkout'}</th>
								<th>{l s='Shipping cost' d='Shop.Theme.Checkout'}</th>
								<th>{l s='Tracking number' d='Shop.Theme.Checkout'}</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$order.shipping item=line}
								<tr>
									<td data-title="{l s='Date' d='Shop.Theme.Global'}">{$line.shipping_date}</td>
									<td data-title="{l s='Carrier' d='Shop.Theme.Checkout'}">{$line.carrier_name}</td>
									<td data-title="{l s='Weight' d='Shop.Theme.Checkout'}">{$line.shipping_weight}</td>
									<td data-title="{l s='Shipping cost' d='Shop.Theme.Checkout'}">{$line.shipping_cost}</td>
									<td data-title="{l s='Tracking number' d='Shop.Theme.Checkout'}">{$line.tracking nofilter}</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				{/if}
			{/block}
    </section>
  {/block}
	
	{block name='order_messages'}
		{include file='customer/_partials/order-messages.tpl'}
  {/block}

  {block name='order_detail'}
		{include file='customer/_partials/order-info.tpl'}
  {/block}

{/block}
