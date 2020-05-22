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
    ></a>
      
		{block name='product_thumbnail'}
      <div class="thumbnail product-thumbnail">
        {if $product.cover}
          <img
            data-src="{$product.cover.bySize.home_default.url}"
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

		{block name='product_variants'}
			{if $product.main_variants}
				{include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
			{/if}
		{/block}

    {block name='product_reviews'}
      {hook h='displayProductListReviews' product=$product}
    {/block}
    
    {block name='product_price_and_shipping'}
      {if $product.show_price}
      <div class="prices product-price-and-shipping">

          {if $product.has_discount}
            {hook h='displayProductPriceBlock' product=$product type="old_price"}
            <span 
              class="regular-price"
              title="{l s='Regular price' d='Shop.Theme.Catalog'}"
            >{$product.regular_price}</span><br>
          {/if}

          {hook h='displayProductPriceBlock' product=$product type="before_price"}
          <span 
            class="price{if $product.has_discount} current-price-discount{/if}"
            title="{l s='Price' d='Shop.Theme.Catalog'}"
            >{$product.price}
          </span>

          {hook h='displayProductPriceBlock' product=$product type='unit_price'}
          {hook h='displayProductPriceBlock' product=$product type='weight'}
        </div>
        
        <div class="shadow"></div>
      {/if}
    {/block}

		{block name='product_flags'}
			<ul class="flags">
				{foreach from=$product.flags item=flag}
					<li class="flag {$flag.type}">{$flag.label}</li>
				{/foreach}
			</ul>
		{/block}
	</article>
{/block}

<!--
{block name='product_miniature_item'}
	{assign var="product_unique" value={counter}}
	
  <article 
		class="product-miniature js-product-miniature" 
		data-id-product="{$product.id_product}"
		data-id-product-attribute="{$product.id_product_attribute}" 
		data-id-product-unique="{$product_unique}" 
		itemscope 
		itemtype="http://schema.org/Product"
		style="background-image: url({$product.cover.large.url})"
		data-full-size-image-url = "{$product.cover.large.url}"
		>
		
	{block name='product_quick_view'}
		<div class="product-quick-view">
			<a 
				class="quick-view icon-arrow-up" 
				href="##" 
			></a>
			<div
				id="quickview-modal-{$product_unique}"
				class="modal fade quickview"
				role="dialog" 
				aria-hidden="true"
			></div>				
		</div>
	{/block}

	{block name='product_short_info'}
		<div class="product-short-info">
		{block name='product_thumbnail'}
			<a href="{$product.url}" class="thumbnail product-thumbnail">
				<img
					src = "{$product.cover.large.url}"
					alt = "{$product.cover.legend}"
					data-full-size-image-url = "{$product.cover.large.url}"
				>
			</a>
		{/block}

		{block name='product_price_and_shipping'}
			{if $product.show_price}
				<div class="product-price-and-shipping">
				{hook h='displayProductPriceBlock' product=$product type="unit_price"}
				{hook h='displayProductPriceBlock' product=$product type="weight"}
				
				{if $product.has_discount}
					{if $product.discount_type === 'percentage'}
						<div class="discount-percentage discount-product">{$product.discount_percentage}</div>
					{elseif $product.discount_type === 'amount'}
						<div class="discount-amount discount-product">{$product.discount_amount_to_display}</div>
					{/if}
					<div class="regular-price">{$product.regular_price}</div>
					{hook h='displayProductPriceBlock' product=$product type="old_price"}
				{/if}
				
				{hook h='displayProductPriceBlock' product=$product type="before_price"}
				<span itemprop="price" class="price">{$product.price}</span>
			</div>
			{/if}
		{/block}

		{block name='product_description_short'}
			<div class="product-description-short" itemprop="description">{$product.description_short nofilter}</div>
		{/block}
		
		{block name='product_flags_availability_and_actions'}
			<ul class="product-list-icons product-list-actions">

			{if $product.add_to_cart_url}
				<a
					class = "icon-basket-loaded add-to-cart"
					title="{l s='Add to cart' d='Shop.Theme.Actions'}"
					alt="{l s='Add to cart' d='Shop.Theme.Actions'}"
					href  = "{$product.add_to_cart_url}"
					rel   = "nofollow"
					data-id-product="{$product.id_product}"
					data-id-product-attribute="{$product.id_product_attribute}"
					data-link-action="add-to-cart"
				></a>
			{/if}
		</ul>
		{/block}

		{block name='product_variants'}
			{include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
		{/block}

	</div>
	{/block}

</article>
{/block}
-->