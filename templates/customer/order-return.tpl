{extends file='page.tpl'}

{block name='page_title'}
  {l s='Return details' d='Shop.Theme.Customeraccount'} {$return.return_number}
{/block}

{block name='page_content'}

  {block name='order_return_infos'}
		<section>
			<p class="icon-loop extender">
				{{l s='We have logged your return request.' d='Shop.Theme.Customeraccount'}|replace:'.':''}
				{l
					s='%number% on %date%'
					d='Shop.Theme.Customeraccount'
					sprintf=['%number%' => $return.return_number, '%date%' => $return.return_date]
				}.

				<ul class="list list-center">
						<li><a href="{$return.details_url}" class="icon-bag">{l s='Order' d='Shop.Theme.Customeraccount'} {$return.reference}</a></li>
					{if $return.state == 2}
						<li><a href="{$return.print_url}" class="icon-doc">{l s='Returns form' d='Shop.Theme.Customeraccount'} {l s='PDF' d='Shop.Theme.Customeraccount'}</a></li>
					{/if}
				</ul>
			</p>

			<h2>{l s='Status' d='Shop.Theme.Customeraccount'}</h2>
			<p>
				{l
					s='The current status of your merchandise return is: [1] %status% [/1]'
					d='Shop.Theme.Customeraccount'
					sprintf=[
						'[1]' => '<strong>',
						'[/1]' => '</strong>',
						'%status%' => $return.state_name
					]
				}
				<br>
				{l
					s='Your package must be returned to us within %number% days of receiving your order.'
					d='Shop.Theme.Customeraccount'
					sprintf=['%number%' => $configuration.number_of_days_for_return]
				}
				<br>
				{l
					s='All products must be returned in their original package and condition, unused and without damage.'
					d='Shop.Pdf'
				}
			</p>
		</section>
  {/block}
	
	{block name='order_return_reminder'}
		{if $return.state == 2}
			<section>
				<h2>{l s='Reminder' d='Shop.Theme.Customeraccount'}</h2>
				<ul>
					<li>
						{l
							s='All merchandise must be returned in its original packaging and in its original state.'
							d='Shop.Theme.Customeraccount'
						}
					</li>
					<li>
						{l
							s='Please print out the [1]returns form[/1] and include it with your package.'
							d='Shop.Theme.Customeraccount'
							sprintf=[
								'[1]' => '<a href="'|cat:$return.print_url|cat:'">',
								'[/1]' => '</a>'
							]
						}
					</li>
					<li>
						{l
							s='Please check the [1]returns form[/1] for the correct address.'
							d='Shop.Theme.Customeraccount'
							sprintf=[
								'[1]' => '<a href="'|cat:$return.print_url|cat:'">',
								'[/1]' => '</a>'
							]
						}
					</li>
				</ul>

				<p>
					{l
						s='When we receive your package, we will notify you by email. We will then begin processing order reimbursement.'
						d='Shop.Theme.Customeraccount'
					}
					<br>
					{l
						s='If the conditions of return listed above are not respected, we reserve the right to refuse your package and/or reimbursement.'
						d='Shop.Theme.Customeraccount'
					}
					<br>
					<a href="{$urls.pages.contact}">{l
							s='Please let us know if you have any questions.'
							d='Shop.Theme.Customeraccount'
						}
					</a>
				</p>
			</section>
		{/if}
	{/block}

	{block name='order_return_list'}
		<section>
			<h2>{{l s='List of items to be returned:' d='Shop.Theme.Customeraccount'}|replace:':':''}</h2>
			<ul class="cart-overview">
				{foreach from=$products item=product}
					<li>
						{include file='catalog/_partials/miniatures/product-line.tpl' product=$product}
						{block name='product_line_actions'}
							<section class="product-actions">
								<section class="product-quantity">
									<span class="icon-loop" title="{l s='Quantity' d='Shop.Theme.Checkout'}">{$product.product_quantity}</span>
								</section>
							</section>
						{/block}
					</li>
				{/foreach}
			</ul>
		</section>
	{/block}

{/block}
