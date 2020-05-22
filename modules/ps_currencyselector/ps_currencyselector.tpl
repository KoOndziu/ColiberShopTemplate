<div class="currency-selector">
    
	<p style="display: none;">{$current_currency.iso_code} ({$current_currency.sign})</p>
	<span class="extender icon-credit-card">
    <span>{{l s='Currency:' d='Shop.Theme.Global'}|regex_replace:"/:/":""}</span>
    <br>
    <span>{$current_currency.iso_code} ({$current_currency.sign})</span>
  </span>
	<ul class="list">
		{foreach from=$currencies item=currency}
			<li class="{if $currency.current}current{/if}">
        <a href="{$currency.url}" rel="nofollow">
          <input
            id="currency-{$currency.iso_code}"
            type="radio"
            name="currency"
            {if $currency.current}checked{/if}
            onclick="location.href='{$currency.url}';"
          ><label 
            for="currency-{$currency.iso_code}"
            >{$currency.name} ({$currency.sign} {$currency.iso_code})
          </label>
        </a>
			</li>
		{/foreach}
	</ul>
  
</div>
