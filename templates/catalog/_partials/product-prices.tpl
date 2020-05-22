{if $product.show_price}
  <div class="product-prices">
		
		<section class="prices">
			{block name='product_discount'}
				{if $product.has_discount}
					<p class="product-discount">
						{hook h='displayProductPriceBlock' product=$product type="old_price"}
						<span class="regular-price">{$product.regular_price}</span>
					</p>

					{if $product.discount_type === 'percentage'}
						<p class="discount-percentage">{$product.discount_percentage}</p>
					{else}
						<p class="discount-amount">{$product.discount_amount_to_display}</p>
					{/if}

				{/if}
			{/block}

			{block name='product_price'}
				<p class="product-price {if $product.has_discount}has-discount{/if}" itemprop="offers" itemscope itemtype="https://schema.org/Offer">
					<link itemprop="availability" href="https://schema.org/InStock"/>
					<meta itemprop="priceCurrency" content="{$currency.iso_code}">
					<span 
						{if $configuration.display_taxes_label}
							alt="{$product.labels.tax_short}" 
							title="{$product.labels.tax_short}" 
						{/if}
						class="current-price" 
						itemprop="price" 
						content="{$product.price_amount}"
					>{$product.price}</span> 

					{block name='product_pack_price'}
						{if $displayPackPrice}
							<span 
								class="product-pack-price"
								>({l s='Instead of %price%' d='Shop.Theme.Catalog' sprintf=['%price%' => $noPackPrice]})
							</span>
						{/if}
					{/block}

					{hook h='displayProductPriceBlock' product=$product type="price"}
				</p>
			{/block}
		</section>
		
		<section class="units"
			{block name='product_unit_price'}
				{if $displayUnitPrice}
					<p class="product-unit-price">{$product.unit_price} / {$product.unity}</p>
				{/if}
			{/block}
		</section>
		
		<section class="taxes">
			{block name='product_without_taxes'}
				{if $priceDisplay == 2}
					<p 
						class="product-without-taxes"
						>{l s='%price% tax excl.' d='Shop.Theme.Catalog' sprintf=['%price%' => $product.price_tax_exc]}
					</p>
				{/if}
			{/block}

			{block name='product_ecotax'}
				{if $product.ecotax.amount > 0}
					<p class="price-ecotax">
						{l s='Including %amount% for ecotax' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.ecotax.value]}
						<br>{if $product.has_discount}{l s='(not impacted by the discount)' d='Shop.Theme.Catalog'}{/if}
					</p>
				{/if}
			{/block}
		</section>

    {hook h='displayProductPriceBlock' product=$product type="weight" hook_origin='product_sheet'}
    {hook h='displayProductPriceBlock' product=$product type="after_price"}

  </div>
{/if}
