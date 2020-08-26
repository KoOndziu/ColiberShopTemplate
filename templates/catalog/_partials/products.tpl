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

<div id="js-product-list" class="products">
  {foreach from=$listing.products item="product"}
    {block name='product_miniature'}
      {include file='catalog/_partials/miniatures/product.tpl' product=$product}
    {/block}
  {/foreach}
</div>