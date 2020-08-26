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