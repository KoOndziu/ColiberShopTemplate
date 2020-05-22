{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
  
  <header class="homeslider {if $category.image}slick{/if}">
		<div class="content thumb">
			<h1>{$category.name}</h1>
			{if $category.description}<div class="category-description">{$category.description nofilter}</div>{/if}
			
			{if $category.image}
				<div 
					class="category-cover" 
					style="background-image: url('{($category.image.large.url)|replace:'-large_default':''}')" 
				></div>
				<img
					class=""
					src="{($category.image.large.url)}"
					alt="{$category.name}"
					title="{$category.name}"
					itemprop="image"
				>
			{/if}
		</div>
  </header>
{/block}
