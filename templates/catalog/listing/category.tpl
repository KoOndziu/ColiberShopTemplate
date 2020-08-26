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

{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
  <header class="{if $category.image}headslide{/if}">
    <div class="headslide-slide">
      {if $category.image}
        <div class="headslide-thumb">
          <img
            class="lazyload"
            data-src="{$category.image.large.url}"
            alt="{$category.name}"
            title="{$category.name}"
            itemprop="image"
          >
        </div>
      {/if}
      <div class="content headslide-content">
        <h1 class="headslide-name category-name">{$category.name}</h1>
        {if $category.description}
          <div class="headslide-description category-description">{$category.description nofilter}</div>
        {/if}
      </div>
    </div>
  </header>
{/block}
