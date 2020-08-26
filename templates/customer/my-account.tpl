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
  {l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
		
	{include file='customer/_partials/customer-info.tpl'}
	<p>{l s='Welcome to your account. Here you can manage all of your personal information and orders.' d='Shop.Theme.Customeraccount'}</p>
	{include file='customer/_partials/my-account-nav.tpl' list_type='grid'}

{/block}
