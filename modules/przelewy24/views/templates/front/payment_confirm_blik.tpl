{extends file='page.tpl'}

{block name='page_title'}
	{l s='Confirm your payment' mod='przelewy24'}
{/block}

{block name='page_content'}
	<p>
		{l s='Thank you for your purchase. You can track your order in history of orders.' mod='przelewy24'}<br>
		<strong>{l s='Please confirm your payment on your mobile device' mod='przelewy24'}!</strong>
	</p>
	<p>
		<a href="http://przelewy24.pl" target="_blank">
			<img src="{$logo_url}"
					 alt="{l s='Pay with Przelewy24' mod='przelewy24'}"/>
		</a>
	</p>
	<ul class="list cart_navigation">
		<li>
			<a 
				href="{$urls.base_url}" 
				class="icon-basket-loaded"
				>{l s='Return to shop' mod='przelewy24'}
			</a>
		</li>
		<li>
			<a 
				class="icon-notebook" 
				href="{$urls.pages.history}"
				>{l s='Show order history' mod='przelewy24'}
			</a>
		</li>
	</ul>

{/block}
