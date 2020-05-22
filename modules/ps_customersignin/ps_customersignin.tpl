<div class="user-info">
	<a 
		class="button account icon-user{if $customer.gender.id eq 2}-female{/if} js-open-modal" 
		href="{$my_account_url}" 
		title="{l s='Your account' d='Shop.Theme.Customeraccount'}" 
		rel="nofollow"
	></a>
	{include file='module:ps_customersignin/ps_customersignin_modal.tpl'}
</div>
