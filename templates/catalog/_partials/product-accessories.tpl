{if $accessories}
  <div class="product-accessories">
    <h2 class="h3 icon-eyeglass">{l s='You might also like' d='Shop.Theme.Catalog'}</h2>
    <div class="products">
      {foreach from=$accessories item="product_accessory"}
        {block name='product_miniature'}
          {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
        {/block}
      {/foreach}
    </div>
  </div>
{/if}