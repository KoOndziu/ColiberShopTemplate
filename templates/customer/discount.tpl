{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Vouchers' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
	<p>{l s='Your vouchers' d='Shop.Theme.Customeraccount'}.</p>
	
  {if $cart_rules}
    <ul class="grid promos">
      {foreach from=$cart_rules item=discount}
        <li>
          <header>
            <span class="h2">{$discount.name}</span>
            <nav>
              <button 
                class="icon-plus code" 
                data-url="{$urls.pages.cart}" 
                data-action="addDiscount"
                data-token="{$static_token}"
                data-code="{$discount.code}"
                title="{l s='Add' d='Shop.Theme.Actions'}"
              ></button>
            </nav>
          </header>
          <a 
            class="code" 
            data-url="{$urls.pages.cart}" 
            data-action="addDiscount"
            data-token="{$static_token}"
            data-code="{$discount.code}"
            >{$discount.code}
          </a>
          <ul class="list">
            <li>{$discount.description}</li>
            <li 
              class="icon-tag" 
              title="{l s='Value' d='Shop.Theme.Checkout'}"
              >{$discount.value}
            </li>
            <li 
              class="icon-arrow-down-circle" 
              title="{l s='Minimum' d='Shop.Theme.Checkout'}"
              >{l s='Minimum' d='Shop.Theme.Checkout'}: {$discount.voucher_minimal}
            </li>
            <li 
              class="icon-puzzle" 
              title="{l s='Cumulative' d='Shop.Theme.Checkout'}"
              >{l s='Cumulative' d='Shop.Theme.Checkout'}: {$discount.voucher_cumulable}
            </li>
            <li 
              class="icon-drawer" 
              title="{l s='Quantity' d='Shop.Theme.Checkout'}"
              >{l s='Quantity' d='Shop.Theme.Checkout'}: {$discount.quantity_for_user}
            </li>
            <li 
              class="icon-clock" 
              title="{l s='Expiration date' d='Shop.Theme.Checkout'}"
              >{$discount.voucher_date}
            </li>
          </ul>
        </li>
      {/foreach}
    </ul>
    
		<div class="table-wrapper">
			<table>
				<thead>
					<tr>
						<th>{l s='Code' d='Shop.Theme.Checkout'}</th>
						<th>{l s='Name' d='Shop.Theme.Checkout'}</th>
						<th>{l s='Value' d='Shop.Theme.Checkout'}</th>
						<th>{l s='Minimum' d='Shop.Theme.Checkout'}</th>
						<th>{l s='Cumulative' d='Shop.Theme.Checkout'}</th>
            <th>{l s='Quantity' d='Shop.Theme.Checkout'}</th>
						<th>{l s='Expiration date' d='Shop.Theme.Checkout'}</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$cart_rules item=cart_rule}
						<tr>
							<td data-title="{l s='Code' d='Shop.Theme.Checkout'}">{$cart_rule.code}</td>
							<td data-title="{l s='Description' d='Shop.Theme.Checkout'}">{$cart_rule.name}</td>
							<td data-title="{l s='Value' d='Shop.Theme.Checkout'}">{$cart_rule.value}</td>
							<td data-title="{l s='Minimum' d='Shop.Theme.Checkout'}">{$cart_rule.voucher_minimal}</td>
							<td data-title="{l s='Cumulative' d='Shop.Theme.Checkout'}">{$cart_rule.voucher_cumulable}</td>
              <td data-title="{l s='Quantity' d='Shop.Theme.Checkout'}">{$cart_rule.quantity_for_user}</td>
							<td data-title="{l s='Expiration date' d='Shop.Theme.Checkout'}">{$cart_rule.voucher_date}</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
  {/if}

{/block}
