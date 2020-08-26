<div class="images-container">
  <div class="product-images js-qv-mask mask js-qv-product-images">
    {for $j=1 to ($product.images|count == 1) ? 1 : 3}
      <div 
        id="thumb-{$j}-{$product.cover.id_image}"
        class="thumb-container"
      >
        <img
          class="thumb js-thumb"
          data-image-medium-src="{$product.cover.bySize.medium_default.url}"
          data-image-large-src="{$product.cover.bySize.large_default.url}"
          src="{$product.cover.bySize.home_default.url}"
          alt="{$product.cover.legend}"
          title="{$product.cover.legend}"
          itemprop="image"
        >
      </div>

      {foreach from=$product.images key=i item=image name=images}
        {if $image.id_image != $product.cover.id_image}
          <div 
            id="thumb-{$j}-{$image.id_image}"
            class="thumb"
          >
            <img
              class="{if $image.id_image == $product.cover.id_image}default{/if}"
              data-image-medium-src="{$image.bySize.medium_default.url}"
              data-image-large-src="{$image.bySize.large_default.url}"
              src="{$image.bySize.home_default.url}"
              alt="{$image.legend}"
              title="{$image.legend}"
              itemprop="image"
            >
          </div>
        {/if}
      {/foreach}

    {/for}
  </div>
</div>