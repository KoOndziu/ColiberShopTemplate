<section class="product-add-to-cart">
  {if !$configuration.is_catalog}

    {block name='product_quantity'}
      <div class="quantity">
        <label for="quantity_wanted">{l s='Quantity' d='Shop.Theme.Catalog'}</label>
        <input
          type="number"
          name="qty"
          id="quantity_wanted"
          value="{$product.quantity_wanted}"
          class="input-group"
          min="{$product.minimal_quantity}"
          >

        {block name='product_minimal_quantity'}
          {if $product.minimal_quantity > 1}
            <small class="product-minimal-quantity">
              {l
                  s='The minimum purchase order quantity for the product is %quantity%.'
                  d='Shop.Theme.Checkout'
                  sprintf=['%quantity%' => $product.minimal_quantity]
              }
            </small>
          {/if}
        {/block}
      </div>
    {/block}

    <div class="add-to-cart">
      {if $product.is_customizable && count($product.customizations.fields)}
        <p class="icon-bulb">{l s='Don\'t forget to save your customization to be able to add to cart' d='Shop.Forms.Help'}!</p>
      {/if}

      {if $product.delivery_information}
        <span class="delivery-information">{$product.delivery_information}</span>
      {/if}

      <button 
        class="
        add-to-cart 
        icon-{if $product.availability eq unavailable}ban{else if $product.availability eq available}basket{else}clock{/if}
        "
        type="submit"
        data-button-action="add-to-cart" 
        {if !$product.add_to_cart_url}disabled{/if}
        >
        {if !$product.add_to_cart_url}
          {l s=$product.availability_message d="Modules.Facetedsearch.Shop"}
        {else}
          {l s='Add to cart' d='Shop.Theme.Actions'}
        {/if}
      </button>
    </div>

  {/if}
</section>
