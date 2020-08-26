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

{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Your addresses' d='Shop.Theme.Customeraccount'}
	<a 
		class="button icon-plus" 
		href="{$urls.pages.address}" 
		data-link-action="add-address"
		title="{l s='Create new address' d='Shop.Theme.Actions'}"
	></a>
{/block}

{block name='page_content'}
  <section id="content" class="grid page-content page-addresses">

    {foreach $customer.addresses as $address}
      {block name='customer_address'}
        {include file='customer/_partials/block-address.tpl' address=$address}
      {/block}
    {/foreach}

  </section>
{/block}
