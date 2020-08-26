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

{extends file='_partials/modal.tpl'}

{block name='modal_attr'}
	{assign var="modal" value=[
      'id' => 'ps-customersignin-modal',
			'class' => 'modal modal-right'
  ]}
{/block}

{block name='modal_title'}
	{l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='modal_body'}
	<div>
		{if $logged}
			{include file='customer/_partials/customer-info.tpl'}
			{include file='customer/_partials/my-account-nav.tpl' list_type='list'}
		{else}
			<ul class="list">
				<li>
					<a
						class="icon-login"
						href="{$urls.pages.authentication}"
						>{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}
					</a>
				</li>
				<li>
					<a
						class="icon-user-follow"
						href="{$urls.pages.register}"
						>{l s='No account? Create one here' d='Shop.Theme.Customeraccount'}
					</a>
				</li>
			</ul>
		{/if}
	</div>
{/block}

{block name='modal_footer'}
	{if $logged}
		<a 
			class="button account icon-user{if $customer.gender.id eq 2}-female{/if}" 
			href="{$my_account_url}" 
			title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}" 
			rel="nofollow">{l s='Your account' d='Shop.Theme.Customeraccount'}
		</a>
		<a 
			class="button submit logout icon-logout"  
			href="{$logout_url}"
			title="{l s='Sign out' d='Shop.Theme.Actions'}"
			rel="nofollow">{l s='Sign out' d='Shop.Theme.Actions'}
		</a>
	{else}
		<a 
			class="button signin icon-user-follow" 
			href="{$urls.pages.register}" 
			title="{l s='Create an account' d='Shop.Theme.Customeraccount'}"
			rel="nofollow">{l s='Create an account' d='Shop.Theme.Customeraccount'}
		</a>
		<a 
			class="button submit login icon-login" 
			href="{$urls.pages.authentication}" 
			title="{l s='Sign in' d='Shop.Theme.Actions'}"
			rel="nofollow">{l s='Sign in' d='Shop.Theme.Actions'}
		</a>
	{/if}
{/block}