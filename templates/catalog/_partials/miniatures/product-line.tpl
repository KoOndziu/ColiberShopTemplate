{block name='product_line'}
	
	{block name='product_line_customized_datas'}
		{if isset($checkbox)}
			<td>
				{if !$product.customizedDatas}
					<input type="checkbox" id="cb_{$product.id_order_detail}" name="ids_order_detail[{$product.id_order_detail}]" value="{$product.id_order_detail}">
				{else}
					{foreach $product.customizations  as $customization}
						<input type="checkbox" id="cb_{$product.id_order_detail}" name="customization_ids[{$product.id_order_detail}][]" value="{$customization.id_customization}">
					{/foreach}
				{/if}
			</td>
		{/if}
	{/block}
	
	{block name='product_line_image'}
		<section class="product-image">
			{* Zachowanie kompatybilności modułem ps_emailalerts *}
			{if isset($product.cover.small.url)}
				<img src="{$product.cover.small.url}">
			{elseif isset($product.cover_url)}
				<img src="{$product.cover_url}" alt=""/>
			{/if}
		</section>
	{/block}
  
	{block name='product_line_details'}
		<section class="product-details">
			
			<div>
				{block name='product_line_name'}
					<span class="product-name">
						{* Zachowanie kompatybilności z sekcją "potwierdzeniem zamówienia", 
							 która nie posiada pola url.*}
						{if isset($product.url)}
							<a 
								href="{$product.url}" 
								data-id_customization="{$product.id_customization|intval}"
							>
								{if isset($product.name)}{$product.name}{/if}
							</a>
						{elseif isset($product.link)}
							<a href="{$product.link}">
								{if isset($product.name)}{$product.name}{/if}
							</a>
						{elseif isset($product.name)}
							{$product.name}
						{elseif isset($product.product_name)}
							{$product.product_name}							
						{/if}
					</span>
				{/block}

				{block name='product_line_reference'}
					{if isset($product.reference)}
						<span 
							class="product-reference"
							title="{l s='Reference' d='Shop.Theme.Catalog'}"
							>({$product.reference})
						</span>
					{/if}
				{/block}
			</div>

			{block name='product_line_attributes'}
				{if isset($product.attributes)}
					{foreach from=$product.attributes key="label" item="value"}
						<div class="product-attributes">
							{* Zachowanie kompatybilności z sekcją "product pack",
								 która ma więcej wartości w kluczu atrybuty. *}
							{if  isset($value.name)}
								<span class="label">{$value.group}: </span>
								<span class="value">{$value.name}</span>
							{else}
								<span class="label">{$label}: </span>
								<span class="value">{$value}</span>
							{/if}
						</div>
					{/foreach}
				{elseif isset($product.attributes_small)}
					<span>{$product.attributes_small}</span>
				{/if}
			{/block}
			
			{block name='product_line_customization'}
				{if isset($product.customizations)}
					{foreach from=$product.customizations item="customization"}
						{foreach from=$customization.fields item="field"}
							<div class="product-line-info">
								<span class="label">{$field.label}: </span>
								<span class="value">
									{if $field.type == 'text'}
										{if $field.id_module}
											{$field.text nofilter}
										{else}
										 {$field.text}
										{/if}
									{elseif $field.type == 'image'}
										<img src="{$field.image.medium.url}">
									{/if}
								</span>
							</div>
						{/foreach}
					{/foreach}
				{/if}
			{/block}

			{block name='product_line_price'}
				{if isset($product.price)}
					<div class="product-price">
						{if isset($product.product_price_wt)}
							{$product.product_price_wt}
						{else}
							{$product.price}
						{/if}
						{if isset($product.unit_price_full)}
							<small class="sub">{$product.unit_price_full}</small>
						{/if}
					</div>
				{/if}
			{/block}
			
		</section>
	{/block}
	
	{block name='product_line_actions'}{/block}
  
{/block}