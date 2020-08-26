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

<section class="product-add-to-cart">
  {if !$configuration.is_catalog}
    {block name='product_quantity'}
      <div class="quantity qty">
        <label for="quantity_wanted">{l s='Quantity' d='Shop.Theme.Catalog'}</label>
        <input
          type="number"
          name="qty"
          id="quantity_wanted"
          value="{$product.quantity_wanted}"
          class="input-group"
          min="{$product.minimal_quantity}"
          aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
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
    
    {if isset($more) && $more}
      <div>
        <span>{l s="See more" d="Shop.Theme.Catalog"}</span>
        {block name='product_more'}
          <a 
            href="{$product.url}" 
            class="button icon-options-vertical"
            title=""
          >{l s="See more" d="Shop.Theme.Catalog"}</a>
        {/block}
      </div>
    {/if}

    <div class="add last">
      {block name='product_availability'}
        <span id="product-availability">
          {if $product.show_availability && $product.availability_message}
            {if $product.availability == 'available'}{elseif $product.availability == 'last_remaining_items'}{else}{/if}
            {$product.availability_message}
          {/if}
        </span>
      {/block}
      <button 
        class="add-to-cart icon-basket"
        type="submit"
        data-button-action="add-to-cart" 
        {if !$product.add_to_cart_url}disabled{/if}
        >{l s='Add to cart' d='Shop.Theme.Actions'}
      </button>
    </div>
  {/if}
</section>
