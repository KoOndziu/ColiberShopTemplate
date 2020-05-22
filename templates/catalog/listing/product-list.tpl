{extends file=$layout}

{block name='aside'}{/block}

{block name='content'}

  {block name='product_list_header'}
    <header class="content">
      <h1>{$listing.label}</h1>
    </header>
  {/block}
  
  {block name='product_list'}
    <div class="content">
      {if $listing.products|count}
        
        <div class='filter_sort_container'>
          {block name='breadcrumb'}
            {include file='_partials/breadcrumb.tpl'}
          {/block}

          {if $listing.rendered_facets}
            <a
              class="button icon-equalizer js-open-modal"
              title="{l s='Filter By' d='Shop.Theme.Actions'}"
              alt="{l s='Filter By' d='Shop.Theme.Actions'}"
            ></a>
            {include file='module:ps_facetedsearch/views/templates/front/catalog/ps_facetedsearch_modal.tpl'}
          {else}
            <a 
              class="button icon-equalizer disabled"
              title="{l s='Filter By' d='Shop.Theme.Actions'}"
              alt="{l s='Filter By' d='Shop.Theme.Actions'}"
            ></a>
          {/if}

          <label 
            class="icon-layers" 
            title="{l s='Sort by:' d='Shop.Theme.Global'}" 
            alt="{l s='Sort by:' d='Shop.Theme.Global'}"
          ></label>
          {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
        </div>

        <div id="js-product-list-container">
          {block name='product_list_top'}
            {include file='catalog/_partials/products-top.tpl' listing=$listing}
          {/block}

          {block name='product_list'}
            {include file='catalog/_partials/products.tpl' listing=$listing}
          {/block}

          {block name='product_list_bottom'}
            {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
          {/block}
        </div>

      {else}
        {include file='errors/not-found.tpl'}
      {/if}
    </div>
  {/block}

{/block}
