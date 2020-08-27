{** 
 * 2019-2020 Konrad Kubala
 * 
 * NOTICE OF LICENSE
 * 
 * This source file is subject to the AFL-3.0
 * that is bundled with this package in the file LICENSE.txt.
 * 
 * @author    Konrad Kubala <000konrad000@gmail.com>
 * @copyright 2007-2020 Konrad Kubala <000konrad000@gmail.com>
 * @license   AFL-3.0
 *}

{if $homeslider.slides}
  <div 
		class="slick slider homeslider headslide" 
		data-autoplay="true"
		data-interval="{$homeslider.speed}" 
		data-wrap="{$homeslider.wrap}" 
		data-pause="{$homeslider.pause}"
		data-slick
	>
    {for $j=1 to ($homeslider.slides|count == 1) ? 1 : 3}
      {foreach from=$homeslider.slides item=slide}
        <div class="headslide-slide">
          <div class="headslide-thumb">
            <img 
              class="" 
              data-lazy="{$slide.image_url}" 
              alt="{$slide.legend|escape}"
              title="{$slide.legend|escape}"
             >
          </div>
          <div class="content headslide-content">
            {if $slide.title}<h1 class="headslide-name slide-name check-text">{$slide.title}</h1>{/if}
            {if $slide.description}<div class="headslide-description slide-description check-text">{$slide.description nofilter}</div>{/if}
            {if $slide.legend}<span class="a headslide-legend slide-legend check-text see-more">{$slide.legend}</span>{/if}
          </div>
          <a href="{$slide.url}" aria-label="{$slide.title}"></a>
        </div>
      {/foreach}
    {/for}
  </div>
{/if}
