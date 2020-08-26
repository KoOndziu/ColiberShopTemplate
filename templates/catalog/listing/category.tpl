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
