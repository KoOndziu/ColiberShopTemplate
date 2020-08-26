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