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

<div class="product-actions">
  <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh"class="flex">
    <input type="hidden" name="token" value="{$static_token}">
    <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
    <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

    {block name='product_share'}
      {hook h='displayShare' product=$product}
    {/block}
    
    {block name='product_variants'}
      {include file='catalog/_partials/product-variants.tpl'}
    {/block}
    
    {block name='product_add_to_cart'}
      {include file='catalog/_partials/product-add-to-cart.tpl'}
    {/block}
    
    {* Input to refresh product HTML removed, block kept for compatibility with themes *}
    {block name='product_refresh'}{/block}
  </form>
</div>