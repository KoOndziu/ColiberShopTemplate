<section id="order_messages">
	<h2>{l s='Messages' d='Shop.Theme.Customeraccount'}</h2>

	{if $order.messages}
		{block name='order_messages_table'}
			<div class="messages">
				{foreach from=$order.messages|@array_reverse item=message}
					<article class="{if $message.id_employee}employee{else}customer{/if}">
						<div class="message">{$message.message nofilter}</div>
						<small>
							<span class="name">{$message.name}</span>
							<span class="date">{$message.message_date}</span>
						</small>
					</article>
				{/foreach}
			</div>
		{/block}
	{else}
		<p>
			{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Customeraccount'}
		</p>
	{/if}

	{block name='order_message_form'}
		<section class="order-message-form">
			<form class="input-text" action="{$urls.pages.order_detail}" method="post">
				<textarea 
					id="msgText"
					rows="1" 
					name="msgText"
					placeholder="{l s='Add a message' d='Shop.Theme.Customeraccount'}"
					></textarea>
				<input type="hidden" name="id_order" value="{$order.details.id}">
				<button
					class="icon-paper-plane"
					type="submit" 
					name="submitMessage"
					title="{l s='Send' d='Shop.Theme.Actions'}"
				></button>
			</form>
		</section>
	{/block}
</section>