{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <p>{l s='Here is a list of pending merchandise returns' d='Shop.Theme.Customeraccount'}.</p>

  {if $ordersReturn && count($ordersReturn)}
		<div class="table-wrapper">
			<table>
				<thead>
					<tr>
						<th>{l s='Order' d='Shop.Theme.Customeraccount'}</th>
						<th>{l s='Return' d='Shop.Theme.Customeraccount'}</th>
						<th>{l s='Date issued' d='Shop.Theme.Customeraccount'}</th>
						<th>{l s='Package status' d='Shop.Theme.Customeraccount'}</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$ordersReturn item=return}
						<tr>
							<td data-title="{l s='Order' d='Shop.Theme.Customeraccount'}"><a href="{$return.details_url}">{$return.reference}</a></td>
							<td data-title="{l s='Return' d='Shop.Theme.Customeraccount'}"><a href="{$return.return_url}">{$return.return_number}</a></td>
							<td data-title="{l s='Date issued' d='Shop.Theme.Customeraccount'}">{$return.return_date}</td>
							<td data-title="{l s='Package status' d='Shop.Theme.Customeraccount'}">{$return.state_name}</td>
							<td>
								{if $return.print_url}
									<a 
										href="{$return.print_url}" 
										target="_blank"
										class="button icon-doc"
										title="{l s='Returns form' d='Shop.Theme.Customeraccount'} {l s='PDF' d='Shop.Theme.Customeraccount'}"
									></a>
								{/if}
								<a 
									href="{$return.return_url}" 
									class="button icon-options-vertical"
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
