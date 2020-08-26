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

<section id="order-summary-content" class="page-content page-order-confirmation">
	<header class="h2">{l s='Your order' d='Shop.Theme.Customeraccount'}</header>
  
  {block name='cart_summary'}
    {include file='checkout/_partials/cart-summary.tpl' cart=$cart}
  {/block}
</section>
