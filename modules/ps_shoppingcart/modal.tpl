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

{extends file='_partials/modal.tpl'}

{block name='modal_attr'}
	{assign var="modal" value=['id' => 'blockcart-modal']}
{/block}

{block name='modal_title'}
	{$product.name}
{/block}

{block name='modal_body'}
	<p>{l s='Product Successfully Added to Your Shopping Cart' d='Shop.Theme.Checkout'}</p>
{/block}

{block name='modal_footer'}
	<a class="icon-basket button" rel="nofollow" href="{$cart_url}">{l s='Cart' d='Shop.Theme.Actions'}</a>
	<a class="icon-check button submit" href="{$urls.pages.order}">{l s='Checkout' d='Shop.Theme.Actions'}</a>
{/block}