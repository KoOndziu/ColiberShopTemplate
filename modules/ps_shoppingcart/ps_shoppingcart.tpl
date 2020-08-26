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

<div class="cart-preview">
  <a	
    class="button icon-basket cart-button js-open-modal js-cart-count"
    href="{$cart_url}" 
    data-cart-count="{$cart.products_count}"
    data-refresh-url="{$refresh_url}"
    rel="nofollow" 
    title="{l s='Cart' d='Shop.Theme.Actions'}" 
  ></a>
  {include file='module:ps_shoppingcart/ps_shoppingcart_modal.tpl'}
</div>