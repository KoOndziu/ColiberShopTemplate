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

{extends file='customer/order-detail.tpl'}

{block name='page_title'}
  {l s='Guest Tracking' d='Shop.Theme.Customeraccount'}
{/block}

{block name='order_messages'}
{/block}

{block name='page_content' append}
  {block name='guest_to_customer'}
		{include file='customer/_partials/guest-to-customer.tpl'}
  {/block}
{/block}
