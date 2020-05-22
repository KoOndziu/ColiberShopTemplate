{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Credit slips' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  
  <p>{l s='Credit slips you have received after canceled orders.' d='Shop.Theme.Customeraccount'}</p>
  
  {block name='credit_slip_table'}
    {if $credit_slips}
			<div class="table-wrapper">
				<table id="credit-slips">
					<thead>
						<tr>
							<th>{l s='Order' d='Shop.Theme.Customeraccount'}</th>
							<th>{l s='Credit slip' d='Shop.Theme.Customeraccount'}</th>
							<th>{l s='Date issued' d='Shop.Theme.Customeraccount'}</th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$credit_slips item=slip}
							<tr>
								<td data-title="{l s='Order' d='Shop.Theme.Customeraccount'}"><a href="{$slip.order_url_details}" data-link-action="view-order-details">{$slip.order_reference}</a></td>
								<td data-title="{l s='Credit slip' d='Shop.Theme.Customeraccount'}">{$slip.credit_slip_number}</td>
								<td data-title="{l s='Date issued' d='Shop.Theme.Customeraccount'}">{$slip.credit_slip_date}</td>
								<td>
									<a 
										href="{$slip.url}" 
										target="_blank"
										class="button icon-doc"
										title="{l s='Credit slip' d='Shop.Theme.Customeraccount'} {l s='PDF' d='Shop.Theme.Customeraccount'}"
									></a>
								</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
			</div>
    {/if}
  {/block}


{/block}
