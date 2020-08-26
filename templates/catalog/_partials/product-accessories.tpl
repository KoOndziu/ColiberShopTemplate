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

{if $accessories}
  <div class="product-accessories">
    <h2 class="h3 icon-eyeglass">{l s='You might also like' d='Shop.Theme.Catalog'}</h2>
    <div class="products">
      {foreach from=$accessories item="product_accessory"}
        {block name='product_miniature'}
          {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
        {/block}
      {/foreach}
    </div>
  </div>
{/if}