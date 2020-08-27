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

{block name='product_miniature_item'}
	<article 
		class="product-miniature js-product-miniature mb-3 {if !$product.main_variants}no-variants{/if}" 
		data-id-product="{$product.id_product}" 
		data-id-product-attribute="{$product.id_product_attribute}"
	>
		
    <a 
      href="{$product.url}" 
      data-link-action="quickview"
      class="quick-view"
      title="{$product.name|truncate:30:'...'}"
      data-toggle="modal" 
      data-target="#quickview-modal-{$product.id}-{$product.id_product_attribute}"
    ></a>
      
		{block name='product_thumbnail'}
      <div class="product-thumbnail">
        {if $product.cover}
          <img
            data-src="{$product.cover.bySize.medium_default.url}"
            alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
            data-full-size-image-url="{$product.cover.large.url}"
            class="lazyload"
          >
        {elseif isset($urls.no_picture_image)}
          <img class="lazyload" src="{$urls.no_picture_image.bySize.home_default.url}">
        {else}
          <img class="lazyload" src="data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==">
        {/if}
      </div>
    {/block}
    
    <div class="product-content">
      {block name='product_flags'}
        {include file='catalog/_partials/product-flags.tpl'}
      {/block}
    
      {block name='product_title'}
        <span class="product-name">{$product.name}</span>
      {/block}

      {block name='product_prices'}
        {include file='catalog/_partials/product-prices.tpl'}
      {/block}

      {block name='product_variants'}
        {if $product.main_variants}
          {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
        {/if}
      {/block}

      {block name='product_reviews'}
        {hook h='displayProductListReviews' product=$product}
      {/block}
    </div>
	</article>
{/block}