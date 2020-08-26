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

{extends file='page.tpl'}

{block name='page_title'}
	{l s='Congratulation!' mod='przelewy24'}
{/block}

{block name='page_content'}
  <div class="extender icon-check">
    <p>
      {l s='Thank you for your purchase. Your payment was confirmed by Przelewy24. You can track your order in history of orders.' mod='przelewy24'}
    </p>
    <p style="display: none">
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