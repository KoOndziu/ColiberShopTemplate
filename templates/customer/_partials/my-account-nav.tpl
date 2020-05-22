<ul class="link-list {$list_type}">

		<li class="{if $page.page_name eq 'my-account'}active{/if}">
			<a 
				class="icon-user"
				href="{$urls.pages.my_account}"
				>{l s='Your account' d='Shop.Theme.Customeraccount'}
			</a>
		</li>

		{if $customer.addresses|count}
		<li class="{if $page.page_name eq 'addresses'}active{/if}">
			<a 
				id="addresses-link" 
				class="icon-map"
				href="{$urls.pages.addresses}"
				>{l s='Your addresses' d='Shop.Theme.Customeraccount'}
			</a>
		</li>
		{else}
		<li class="{if $page.page_name eq 'address'}active{/if}">
			<a 
				id="address-link"
				class="icon-map"
				href="{$urls.pages.address}"
				>{l s='Add first address' d='Shop.Theme.Customeraccount'}
			</a>
		</li>
		{/if}

		<li class="{if $page.page_name eq 'identity'}active{/if}">
			<a 
				id="identity-link" 
				class="icon-info"
				href="{$urls.pages.identity}"
				>{l s='Your personal information' d='Shop.Theme.Customeraccount'}
			</a>
		</li>

  {if !$configuration.is_catalog}
		<li class="{if $page.page_name eq 'history'}active{/if}">
			<a 
				id="history-link" 
				class="icon-notebook"
				href="{$urls.pages.history}"
				>{l s='Order history' d='Shop.Theme.Customeraccount'}
			</a>
		</li>

		<li class="{if $page.page_name eq 'order-slip'}active{/if}">
			<a 
				id="order-slips-link"
				class="icon-note"
				href="{$urls.pages.order_slip}"
				>{l s='Credit slips' d='Shop.Theme.Customeraccount'}
			</a>
		</li>

		{if $configuration.voucher_enabled}
		<li class="{if $page.page_name eq 'discount'}active{/if}">
			<a 
				id="discounts-link" 
				class="icon-tag"
				href="{$urls.pages.discount}"
				>{l s='Vouchers' d='Shop.Theme.Customeraccount'}
			</a>
		</li>
		{/if}

		{if $configuration.return_enabled}
		<li class="{if $page.page_name eq 'order-follow'}active{/if}">
			<a 
				id="returns-link" 
				class="icon-loop"
				href="{$urls.pages.order_follow}"
				>{l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
			</a>
		</li>
		{/if}

	{/if}
	
	{hook h='displayCustomerAccount' link=$link}
		
</ul>