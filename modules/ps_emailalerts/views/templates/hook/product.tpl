<form>
	<div 
		class="js-mailalert"
		data-url="{url 
								entity='module' 
								name='ps_emailalerts' 
								controller='actions' 
								params=['process' => 'add']}"
	>
		{if isset($email) AND $email}
			<input 
				class="form-control" 
				type="email" 
				placeholder="{l s='your@email.com' d='Modules.Mailalerts.Shop'}"
			>
		{/if}
		
		{if isset($id_module)}
			{hook h='displayGDPRConsent' id_module=$id_module}
		{/if}
		
		<input type="hidden" value="{$id_product}"/>
		<input type="hidden" value="{$id_product_attribute}"/>
		<button 
			class="btn" 
			type="submit" 
			rel="nofollow" 
			onclick="return addNotification();"
			>{l s='Notify me when available' d='Modules.Mailalerts.Shop'}
		</button>
	</div>
</form>
