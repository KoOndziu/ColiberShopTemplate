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