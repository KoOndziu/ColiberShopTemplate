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

<div class="card">
  <div id="card-heading-{$card.id}" class="card-header">
    <h2 class="h3">
      <a 
        class="{if isset($card.icon) && $card.icon}{$card.icon}{/if} {if isset($card.show) && $card.show}collapsed{/if}"
        data-toggle="collapse"
        aria-expanded="{if isset($card.show) && $card.show}true{/if}" 
        data-target="#card-collapse-{$card.id}" 
        aria-controls="card-collapse-{$card.id}"
        href="#card-collapse-{$card.id}"
        >{$card.name}
      </a>
    </h2>
  </div>
  <div 
    id="card-collapse-{$card.id}" 
    class="collapse {if isset($card.show) && $card.show}show{/if}"
    aria-labelledby="card-heading-{$card.id}" 
    data-parent="#{$card.accordionid}"
  >
    <div class="card-body">{$card.content nofilter}</div>
  </div>
</div>