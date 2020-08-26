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

<div class="user-info">
	<a 
		class="button account icon-user{if $customer.gender.id eq 2}-female{/if} js-open-modal" 
		href="{$my_account_url}" 
		title="{l s='Your account' d='Shop.Theme.Customeraccount'}" 
		rel="nofollow"
	></a>
	{include file='module:ps_customersignin/ps_customersignin_modal.tpl'}
</div>
