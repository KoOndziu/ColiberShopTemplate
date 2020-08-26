{extends file=$layout}

{block name='sidenav'}
  <li>
    <button 
      class="button submit icon-layers js-open-modal"
      title="{l s='Sort' d='Shop.Theme.Actions'}"
      data-target="sort-orders-modal"
      {if !$listing.rendered_facets}disabled{/if}
    ></button>
    {include file='catalog/_partials/sort-orders-modal.tpl'}
  </li>
  <li>
    <button 
      class="button submit icon-equalizer js-open-modal"
      title="{l s='Filter' d='Shop.Theme.Actions'}"
      data-target="ps-facetedsearch-modal"
      {if !$listing.rendered_facets}disabled{/if}
    ></button>
    {include file='module:ps_facetedsearch/views/templates/front/catalog/ps_facetedsearch_modal.tpl'}
  </li>
{/block}

{block name='content'}

  {block name='product_list_header'}
    <header class="content">
      <h1>{$listing.label}</h1>
    </header>
  {/block}
  
  {block name='product_list'}    
    <div class="content">
      {block name='breadcrumb'}
        {include file='_partials/breadcrumb.tpl'}
      {/block}
      
      {if $listing.products|count}
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
        <div id="js-product-list-top"></div>

        <div id="js-product-list">
          {include file='errors/not-found.tpl'}
        </div>

        <div id="js-product-list-bottom"></div>
      {/if}
    </div>
  {/block}

{/block}
