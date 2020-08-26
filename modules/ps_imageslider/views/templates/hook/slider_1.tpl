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
        <img class="photo" src="{$slide.image_url}" alt="{$slide.legend|escape}" />
        {if $slide.title || $slide.description }
          <span class="h1 text">{$slide.title}</span>
          <span class="text">{$slide.description nofilter}</span>
        {/if}
				<a href="{$slide.url}"></a>
			</div>
		{/foreach}
  </div>
{/if}
