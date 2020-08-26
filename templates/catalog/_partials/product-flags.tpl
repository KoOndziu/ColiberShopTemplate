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

{block name='product_flags'}
	<ul class="product-flags">
		{foreach from=$product.flags item=flag}
			<li class="product-flag {$flag.type}">{$flag.label}</li>
		{/foreach}
	</ul>
{/block}