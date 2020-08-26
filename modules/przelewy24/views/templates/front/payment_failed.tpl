{extends file='page.tpl'}

{block name='page_title'}
	{l s='Payment failed!' mod='przelewy24'}
{/block}

{block name='page_content'}
  <div class="extender icon-close">
    <p class="warning">
      {l s='Your payment was not confirmed by Przelewy24. Contact with your seller for more information.' mod='przelewy24'}
    </p>
    {if isset($errorReason)}
      <p>
        <strong>{$errorReason}</strong>
      </p>
    {/if}
    <p style="display: none;">
      <a href="http://przelewy24.pl" target="_blank">
        <img src="{$logo_url}"
             alt="{l s='Pay with Przelewy24' mod='przelewy24'}"/>
      </a>
    </p>
  </div>
  <ul class="list list-center">
    <li>
      <a 
        class="icon-basket-loaded"
        href="{$urls.base_url}" 
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