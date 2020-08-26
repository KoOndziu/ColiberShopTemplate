<div id="product-accordion" class="accordion">

  {block name='product_description'}
    {if $product.description or $product.description_short}
      {include 
        file='_partials/accordion-card.tpl'
        card=[
          "id" => "description",
          "icon" => "icon-note",
          "show" => {$product.description or $product.description_short},
          "name" => {l s='Description' d='Shop.Theme.Catalog'},
          "accordionid" => "product-accordion",
          "content" => {include file='catalog/_partials/product-accordion-description.tpl'}
        ]
      }
    {/if}
  {/block}
  
  {block name='product_details'}
      {include 
        file='_partials/accordion-card.tpl'
        card=[
          "id" => "details",
          "icon" => "icon-list",
          "show" => {!$product.description and !$product.description_short},
          "name" => {l s='Product Details' d='Shop.Theme.Catalog'},
          "accordionid" => "product-accordion",
          "content" => {include file='catalog/_partials/product-details.tpl'}
        ]
      }
  {/block}
  
  {block name='product_attachments'}
    {if $product.attachments}
      {include 
        file='_partials/accordion-card.tpl'
        card=[
          "id" => "attachments",
          "icon" => "icon-cloud-download",
          "name" => {l s='Attachments' d='Shop.Theme.Catalog'},
          "accordionid" => "product-accordion",
          "content" => {include file='catalog/_partials/product-accordion-attachments.tpl'}
        ]
      }
    {/if}
  {/block}
  
  {block name='product_pack'}
    {if $packItems}
      {include 
        file='_partials/accordion-card.tpl'
        card=[
          "id" => "pack",
          "icon" => "icon-note",
          "name" => {l s='Pack content' d='Shop.Theme.Catalog'},
          "accordionid" => "product-accordion",
          "content" => {include file='catalog/_partials/product-accordion-pack.tpl'}
        ]
      }
    {/if}
  {/block}
  
  {block name='product_discounts'}
    {if $product.quantity_discounts}
      {include 
        file='_partials/accordion-card.tpl'
        card=[
          "id" => "discounts",
          "icon" => "icon-tag",
          "name" => {l s='Volume discounts' d='Shop.Theme.Catalog'},
          "accordionid" => "product-accordion",
          "content" => {include file='catalog/_partials/product-discounts.tpl'}
        ]
      }
    {/if}
  {/block}
  
  {block name='product_extra'}
    {if $product.extraContent}
      {foreach from=$product.extraContent item=extra key=extraKey}
        {include 
          file='_partials/accordion-card.tpl'
          card=[
            "id" => "extra-{$extraKey}",
            "icon" => "icon-options",
            "name" => {$extra.title},
            "accordionid" => "product-accordion",
            "content" => {$extra.content nofilter}
          ]
        }
      {/foreach}
    {/if}
  {/block}
  
</div>