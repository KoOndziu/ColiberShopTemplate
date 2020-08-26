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
    id="homeslider"
    class="homeslider-container" 
    data-interval="{$homeslider.speed}" 
    data-wrap="{$homeslider.wrap}" 
    data-pause="{$homeslider.pause}"
  >
    <ul class="rslides homeslider" role="listbox">
      {foreach from=$homeslider.slides item=slide name='homeslider'}
        <li class="slide ">
          <a href="{$slide.url}">
            <figure>
              <img src="{$slide.image_url}" alt="{$slide.legend|escape}" />
              {if $slide.title || $slide.description }
                <figcaption>
                  <h2>{$slide.title}</h2>
                  <div>{$slide.description nofilter}</div>
                </figcaption>
              {/if}
            </figure>
          </a>
        </li>
      {/foreach}
    </ul>
    <nav aria-label="{l s='Carousel buttons' d='Shop.Theme.Global'}">
      <a 
        class="icon-arrow-left prev"  
        role="button" 
        data-slide="prev" 
        aria-hidden="true"
      ></a>
      <a 
        class="icon-arrow-right next" 
        role="button" 
        data-slide="next" 
        aria-hidden="true"
      ></a>
    </nav>
  </div>
{/if}
