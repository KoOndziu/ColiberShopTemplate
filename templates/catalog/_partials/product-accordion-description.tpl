<div class='product-description'>
  {if $product.description}
    {$product.description nofilter}
  {else}
    {$product.description_short nofilter}
  {/if}
</div>