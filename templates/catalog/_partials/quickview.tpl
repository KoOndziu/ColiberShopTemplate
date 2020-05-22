{extends file='_partials/modal.tpl'}

{block name='modal_attr'}
	{assign var="modal" value=[
			'id' => "{'quickview-modal-'}{$product.id}{'-'}{$product.id_product_attribute}",
			'class' => 'modal modal-bottom quickview product'
	]}
{/block}

{block name='modal_title'}
	<span itemprop="name">{$product.name}</span>
{/block}

{block name='modal_body'}
	<header class="product-header">
		<div class="product-information">
			{block name='product_prices'}
				{include file='catalog/_partials/product-prices.tpl'}
			{/block}

			{block name='product_description_short'}
				<div 
					class="product-description-short"
					id="product-description-short" 
					itemprop="description"
					>{$product.description_short nofilter}
				</div>
			{/block}
		</div>

		{block name='product_cover_thumbnails'}
			{include file='catalog/_partials/product-cover-thumbnails.tpl'}
		{/block}

	</header>

{/block}

{block name='modal_footer'}
  <section class="product-actions">
    {if $product.is_customizable && count($product.customizations.fields)}
      {block name='product_customization'}
        {include file='catalog/_partials/product-customization.tpl' customizations=$product.customizations}
      {/block}
    {/if}

    <form 
      id="add-to-cart-or-refresh"
      class="flex"
      action="{$urls.pages.cart}" 
      method="post"
    >
      <input type="hidden" name="token" value="{$static_token}">
      <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
      <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

      {block name='product_variants'}
        {include file='catalog/_partials/product-variants.tpl'}
      {/block}

      {block name='product_add_to_cart'}
        {include file='catalog/_partials/product-add-to-cart.tpl'}
      {/block}
      
      {block name='product_more'}
        <a 
          href="{$product.url}" 
          class="button icon-options"
          title=""
        ></a>
      {/block}

      {* Input to refresh product HTML removed, block kept for compatibility with themes *}
      {block name='product_refresh'}{/block}
    </form>

    {block name='product_additional_info'}
      {include file='catalog/_partials/product-additional-info.tpl' product=$product}
    {/block}
  </section>
{/block}