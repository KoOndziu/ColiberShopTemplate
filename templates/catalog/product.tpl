{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
  <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
  <meta property="product:price:amount" content="{$product.price_amount}">
  <meta property="product:price:currency" content="{$currency.iso_code}">
  {if isset($product.weight) && ($product.weight != 0)}
    <meta property="product:weight:value" content="{$product.weight}">
    <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='main'}
  <main id="main" class="product">
    <meta itemprop="url" content="{$product.url}">

    {block name='product_activation'}
      {include file='catalog/_partials/product-activation.tpl'}
    {/block}

    {block name='page_header'}
      <header class="product-header">
				
				<div class="product-information content">
					<h1 itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>

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

    {block name='page_content'}
			<section class="product-actions">
				<div class="content">

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

						{* Input to refresh product HTML removed, block kept for compatibility with themes *}
						{block name='product_refresh'}{/block}
					</form>

					{block name='product_additional_info'}
						{include file='catalog/_partials/product-additional-info.tpl'}
					{/block}
					
				</div>
			</section>
			
			<section class="product-share">
				{hook h='displayShare' product=$product}
			</section>
			
			<section 
				id="tab-content"
				class="product-tabs tabs tab-content content"   
				data-product="{$product|json_encode}" 
				role="tablist"
			>

				{if $product.description}
					<input type="radio" id="description-tab" name="tabs" {if $product.description}checked{/if}>
					<label for="description-tab">{l s='Description' d='Shop.Theme.Catalog'}</label>
					<div role="tabpanel">

						{block name='product_description'}
							{if $product.description}
								<section class="product-description">
									{$product.description nofilter}
								</section>
							{/if}
						{/block}

					</div>
				{/if}

				{if 1}
					<input type="radio" id="product-details-tab" name="tabs" {if !$product.description}checked{/if}>
					<label for="product-details-tab">{l s='Product Details' d='Shop.Theme.Catalog'}</label>
					<div role="tabpanel">

						{block name='product_details'}
							{include file='catalog/_partials/product-details.tpl'}
						{/block}

					</div>
				{/if}

				{if $product.attachments}
					<input type="radio" id="attachments-tab" name="tabs">
					<label for="attachments-tab" >{l s='Attachments' d='Shop.Theme.Catalog'}</label>
					<div role="tabpanel">

						{block name='product_attachments'}
							{if $product.attachments}
								<section class="product-attachments grid">
									{foreach from=$product.attachments item=attachment}
										<a 
											class="attachment" 
											href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}"
										>
											<header>
												<span class="h2">{$attachment.name}</span>
												<nav>
													<button class="icon-cloud-download"></button>
												</nav>
											</header>
											<p>
												{$attachment.description}<br>
												{$attachment.file_size_formatted}
											</p>
										</a>
									{/foreach}
								</section>
							{/if}
						{/block}

					</div>
				{/if}

				{if $packItems}
					<input type="radio" id="product-pack-tab" name="tabs">
					<label for="product-pack-tab" >{l s='Pack content' d='Shop.Theme.Catalog'}</label>
					<div role="tabpanel">

						{block name='product_pack'}
							{if $packItems}
								<section class="product-pack">
									<ul class="cart-overview">
										{foreach from=$packItems item="product_pack"}
											<li>
												{include file='catalog/_partials/miniatures/product-line.tpl' product=$product_pack}
												{block name='product_line_actions'}
													<section class="product-actions">
														<section class="product-description" style="display: none">
															{$product.description_short nofilter}
														</section>
													</section>
												{/block}
											</li>
										{/foreach}
									</ul>
								</section>
							{/if}
						{/block}

					</div>
				{/if}

				{if $product.quantity_discounts}
					<input type="radio" id="product-discounts-tab" name="tabs">
					<label for="product-discounts-tab" >{l s='Volume discounts' d='Shop.Theme.Catalog'}</label>
					<div role="tabpanel">

						{block name='product_discounts'}
							{include file='catalog/_partials/product-discounts.tpl'}
						{/block}

					</div>
				{/if}

				{foreach from=$product.extraContent item=extra key=extraKey}
					<input type="radio" id="extra-{$extraKey}-tab" name="tabs">
					<label for="extra-{$extraKey}-tab">{$extra.title}</label>
					<div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
						{$extra.content nofilter}
					</div>
				{/foreach}

			</section>
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer content">
				
				{block name='product_accessories'}
          {if $accessories}
            <section class="product-accessories">
              <h2>{l s='Accessories' d='Shop.Theme.Catalog'}</h2>
							<div class="products">
								{foreach from=$accessories item="product_accessory"}
									{block name='product_miniature'}
										{include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
									{/block}
								{/foreach}
							</div>
            </section>
          {/if}
        {/block}
				
        {block name='product_footer'}
          {hook h='displayFooterProduct' product=$product category=$category}
        {/block}
				
      </footer>
    {/block}
    
  </main>
{/block}
