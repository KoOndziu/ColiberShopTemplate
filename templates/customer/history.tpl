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
  {l s='Order history' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  
  <p>{l s='Here are the orders you\'ve placed since your account was created.' d='Shop.Theme.Customeraccount'}</p>
  
  {if $orders}
  <div class="table-wrapper">
    <table>
      <thead>
        <tr>
          <th>{l s='Order' d='Shop.Theme.Customeraccount'}</th>
          <th>{l s='Date issued' d='Shop.Theme.Customeraccount'}</th>
          <th>{l s='Total price' d='Shop.Theme.Checkout'}</th>
          <th>{l s='Payment' d='Shop.Theme.Checkout'}</th>
          <th>{l s='Status' d='Shop.Theme.Checkout'}</th>
          <th>&nbsp;</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$orders item=order}
          <tr>
            <td data-title="{l s='Order reference' d='Shop.Theme.Checkout'}">
							<a 
								href="{$order.details.details_url}" 
								data-link-action="view-order-details"
							>{$order.details.reference}</a>
						</td>
            <td data-title="{l s='Date' d='Shop.Theme.Checkout'}">{$order.details.order_date}</td>
            <td data-title="{l s='Total price' d='Shop.Theme.Checkout'}">{$order.totals.total.value}</td>
            <td data-title="{l s='Payment' d='Shop.Theme.Checkout'}">{$order.details.payment}</td>
            <td data-title="{l s='Status' d='Shop.Theme.Checkout'}">
              <i class="order-status-color" style="background:{$order.history.current.color}"></i><span
                class="order-status-label {$order.history.current.contrast}"
								>{$order.history.current.ostate_name}
              </span>
            </td>
            <td>
							{if $order.details.invoice_url}
                <a 
									href="{$order.details.invoice_url}"
									target="_blank"
									class="button icon-doc order-invoice-link"
									title="{l s='Invoice' d='Shop.Theme.Checkout'} {l s='PDF' d='Shop.Theme.Customeraccount'}"
								></a>
              {/if}
              {if $order.details.reorder_url}
                <a 
									href="{$order.details.reorder_url}" 
									class="button icon-reload order-reorder-link"
									title="{l s='Reorder' d='Shop.Theme.Actions'}"
								></a>
              {/if}
								<a 
									href="{$order.details.details_url}" 
									class="button icon-options-vertical" 
									data-link-action="view-order-details"
									title="{l s='Details' d='Shop.Theme.Customeraccount'}"
								></a>
            </td>
          </tr>
        {/foreach}
      </tbody>
    </table>
  </div>
  {/if}

{/block}
