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

{block name='totals'}
	<dl class="totals">
		{foreach from=$subtotals item="subtotal"}
			{if $subtotal.value}
				{if $subtotal.type === 'products'}
					<dt class="label {$subtotal.type} icon-basket-loaded">{$subtotal.label}</dt>
					<dd class="value {$subtotal.type}">{$subtotal.value}</dd>
				{else if $subtotal.type === 'discount'}
					<dt class="label {$subtotal.type} icon-tag">{$subtotal.label}</dt>
					<dd class="value {$subtotal.type}">- {$subtotal.value}</dd>
				{else if $subtotal.type === 'tax'}
					<dt class="label {$subtotal.type} icon-calculator">{$subtotal.label}</dt>
					<dd class="value {$subtotal.type}">{$subtotal.value}</dd>
				{else if $subtotal.type === 'gift_wrapping'}
					<dt class="label {$subtotal.type} icon-present">{$subtotal.label}</dt>
					<dd class="value {$subtotal.type}">{$subtotal.value}</dd>
				{else if $subtotal.type === 'shipping'}
					<dt class="label {$subtotal.type} icon-plane">{$subtotal.label} {hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}</dt>
					<dd class="value {$subtotal.type}">{$subtotal.value}</dd>
				{else}
					<dt class="label {$subtotal.type}">{$subtotal.label}</dt>
					<dd class="value {$subtotal.type}">{$subtotal.value}</dd>
				{/if}
			{/if}
		{/foreach}

		<dt class="label total icon-wallet">{$totals.total.label}</dt>
		<dd class="value total">{$totals.total.value}</dd>
	</dl>
{/block}