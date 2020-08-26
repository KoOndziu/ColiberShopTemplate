{if $packItems}
  <section class="product-pack">
    <ul class="cart-overview">
      {foreach from=$packItems item="product_pack"}
        <li>
          {include file='catalog/_partials/miniatures/product-line.tpl' product=$product_pack}
          {block name='product_line_actions'}
            <section class="product-actions">
              <section class="product-description" style="display: none">
                {$product.description_short nofilter}
              </section>
            </section>
          {/block}
        </li>
      {/foreach}
    </ul>
  </section>
{/if}