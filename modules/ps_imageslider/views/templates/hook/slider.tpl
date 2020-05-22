{if $homeslider.slides}
  <div 
		class="slick slider homeslider" 
		data-autoplay="true"
		data-interval="{$homeslider.speed}" 
		data-wrap="{$homeslider.wrap}" 
		data-pause="{$homeslider.pause}"
		data-slick
	>
		{foreach from=$homeslider.slides item=slide}
			<div>
				<a href="{$slide.url}">
					<img class="photo" src="{$slide.image_url}" alt="{$slide.legend|escape}" />
				
					{if $slide.title || $slide.description }
						<span class="h1 text">{$slide.title}</span>
						<span class="text">{$slide.description nofilter}</span>
					{/if}
				</a>
			</div>
		{/foreach}
  </div>
{/if}
