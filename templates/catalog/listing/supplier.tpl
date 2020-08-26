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
{*
 * With this file, we display all product from a supplier the same way than any other page
 * but we want a different header so we give more details about the supplier.
 *}
{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
  <h1>
    {l s='List of products by supplier %supplier_name%' sprintf=['%supplier_name%' => $supplier.name] d='Shop.Theme.Catalog'}
  </h1>
  <div id="supplier-description">{$supplier.description nofilter}</div>
{/block}
