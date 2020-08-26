{extends file='_partials/modal.tpl'}

{block name='modal_attr'}
	{assign var="modal" value=[
			'id' => "{'quickview-modal-'}{$product.id}{'-'}{$product.id_product_attribute}",
			'class' => 'modal modal-bottom quickview product'
	]}
{/block}

{block name='modal_title_container'}
  <span class="modal-title">
    {block name='modal_title'}
      <span class="h2" itemprop="name">{$product.name}</span>
    {/block}
    
    {block name='product_prices'}
      {include file='catalog/_partials/product-prices.tpl'}
    {/block}
  </span>
{/block}

{block name='modal_body'}
  {block name='product_cover_thumbnails'}
    {include file='catalog/_partials/product-cover-thumbnails.tpl'}
  {/block}
{/block}

{block name='modal_footer'}
  <div class="page-content product-information content">
    {block name='page_content'}

      {block name='product_description_short'}
        <div id="product-description-short-{$product.id}" itemprop="description">{$product.description_short nofilter}</div>
      {/block}

      {block name='product_customization'}
        {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
      {/block}

      {block name='product_add_to_cart'}
        {include file='catalog/_partials/product-actions.tpl' more=1}
      {/block}

      {block name='product_additional_info'}
        {include file='catalog/_partials/product-additional-info.tpl'}
      {/block}

    {/block}
  </div>
{/block}