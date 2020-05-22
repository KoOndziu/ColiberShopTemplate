<div id="product-details" data-product="{$product|json_encode}">
	
	<dl>
		{if isset($product_manufacturer->id)}
			<dt>{l s='Brand' d='Shop.Theme.Catalog'}</dt>
			{if isset($manufacturer_image_url)}
				<dd>
					<a href="{$product_brand_url}">
						<img src="{$manufacturer_image_url}" />
					</a>
				</dd>
			{else}
				<dd>
					<a href="{$product_brand_url}">{$product_manufacturer->name}</a>
				</dd>
			{/if}
		{/if}

		{block name='product_reference'}
			{if $product.reference}
				<dt>{l s='Reference' d='Shop.Theme.Catalog'}</dt>
				<dd itemprop="sku">{$product.reference}</dd>
			{/if}
		{/block}

		{* if product have specific references, a table will be added to product details section *}
		{* kody *}
		{block name='product_specific_references'}
			{if $product.specific_references}
				{foreach from=$product.specific_references item=reference key=key}
					<dt class="name">{$key}</dt>
					<dd class="value">{$reference}</dd>
				{/foreach}
			{/if}
		{/block}

		{block name='product_quantities'}
			{if $product.show_quantities}
				<dt>{l s='In stock' d='Shop.Theme.Catalog'}</dt>
				<dd>{$product.quantity} {$product.quantity_label}</dd>
			{/if}
		{/block}

		{block name='product_availability_date'}
			{if $product.availability_date}
				<dt>{l s='Availability date:' d='Shop.Theme.Catalog'}</dt>
				<dd>{$product.availability_date}</dd>
			{/if}
		{/block}
		
		{block name='product_condition'}
			{if $product.condition}
				<dt>{l s='Condition' d='Shop.Theme.Catalog'}</dt>
				<dd>{$product.condition.label}</dd>
			{/if}
		{/block}
		
		{block name='product_features'}
			{if $product.grouped_features}
				{foreach from=$product.grouped_features item=feature}
					<dt>{$feature.name}</dt>
					<dd>{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
				{/foreach}
			{/if}
		{/block}
	</dl>

	{block name='product_out_of_stock'}
		{hook h='actionProductOutOfStock' product=$product}
	{/block}	
  
</div>