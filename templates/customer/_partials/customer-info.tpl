{block name='customer_info'}
	<section class="customer-info">
		<div class="customer-general {if $customer.gender.id eq 2}icon-user-female{else}icon-user{/if} extender">
			<a class="customer-name"	href="{$urls.pages.my_account}">{$customer.firstname} {$customer.lastname}</a><br>
			<a class="customer-email"	href="{$urls.pages.identity}">{$customer.email}</a>
		</div>
  </section>
			
  <!--<section class="customer-info">
    <p class="customer-name">
      {$customer.gender.name[$customer.gender.id]} 
      <strong>{$customer.firstname} {$customer.lastname}</strong>
    </p>
    <a 
      href="{$urls.pages.identity}"
      class="{$customer.gender.id} {if $customer.gender.id eq 1}icon-user{else}icon-user-female{/if}"
    >
    </a>
    <dl>
      <dt class="icon-envelope">{l s='Email' d='Shop.Forms.Labels'}</dt>
      <dd>{$customer.email}</dd>
      <dt class="icon-bell">{l s='Newsletter' d='Modules.Email.subscription.Shop'}</dt>
      <dd>{if $customer.newsletter}<span class="icon-check"></span>{else}<span class="icon-close"></span>{/if}</dd>
      <dt class="icon-people">{l s='Receive offers from our partners' d='Shop.Theme.Customeraccount'}</dt>
      <dd>{if $customer.optin}<span class="icon-check"></span>{else}<span class="icon-close"></span>{/if}</dd>
      <dt class="icon-event">{l s='Birthdate' d='Shop.Forms.Labels'}</dt>
      <dd>{if $customer.birthday|intval}{$customer.birthday}{else}<span class="icon-minus"></span>{/if}</dd>
      <dt class="icon-pencil">{l s='Registration' d='Admin.Orderscustomers.Feature'}</dt>
      <dd>{if $customer.date_add|intval}{$customer.date_add}{else}<span class="icon-minus">{/if}</dd>
      <dt class="icon-login">{l s='Last visit' d='Admin.Orderscustomers.Feature'}</dt>
      <dd>{if $customer.date_upd|intval}{$customer.date_upd}{else}<span class="icon-minus">{/if}</dd>
    </dl>
  </section>-->
{/block}