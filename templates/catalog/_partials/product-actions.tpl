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