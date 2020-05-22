<div class="guest-to-customer">
	<h2>{l s='Create an account' d='Shop.Theme.Customeraccount'}</h2>
	<p>{l s='Transform your guest account into a customer account and enjoy:' d='Shop.Theme.Customeraccount'}</p>
	<ul class="">
		<li class="icon-login">{l s='Personalized and secure access' d='Shop.Theme.Customeraccount'}</li>
		<li class="icon-check">{l s='Fast and easy checkout' d='Shop.Theme.Customeraccount'}</li>
		<li class="icon-loop">{l s='Easier merchandise return' d='Shop.Theme.Customeraccount'}</li>
	</ul>

	<form class="input-text" action="{$urls.pages.guest_tracking}" method="post">
		<input 
			id=guest-to-customer-input" 
			type="password" 
			data-validate="isPasswd" 
			name="password" 
			value=""
			placeholder="{l s='Password' d='Shop.Forms.Labels'}"
			>
		<input type="hidden" name="submitTransformGuestToCustomer" value="1">
		<input type="hidden" name="id_order" value="{$order.details.id}">
		<input type="hidden" name="order_reference" value="{$order.details.reference}">
		<input type="hidden" name="email" value="{$guest_email}">
		<button class="icon-check" type="submit" title="{l s='Send' d='Shop.Theme.Actions'}"></button>
	</form>
</div>