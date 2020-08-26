{**
* 2007-2019 PrestaShop and Contributors
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License 3.0 (AFL-3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* https://opensource.org/licenses/AFL-3.0
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to https://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2019 PrestaShop SA and Contributors
* @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
* International Registered Trademark & Property of PrestaShop SA
*}
{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
    <meta property="product:weight:value" content="{$product.weight}">
    <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}
  {block name='breadcrumb'}
    <nav class="breadcrumb content">
      {include file='_partials/breadcrumb.tpl'}
    </nav>
  {/block}

  <main id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    {block name='page_header_container'}
      <header class="page-header product-header">
        {block name='page_header'}
          <div class="content">
            <h1 itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
          </div>

          {block name='product_cover_thumbnails'}
            {include file='catalog/_partials/product-cover-thumbnails.tpl'}
          {/block}

          <!--{block name='product_flags'}
            {include file='catalog/_partials/product-flags.tpl'}
          {/block}-->
        {/block}
      </header>
    {/block}

    {block name='page_content_container'}
      <div class="page-content product-information content">
        {block name='page_content'}
          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}
          
          {block name='product_description_short'}
            <div id="product-description-short-{$product.id}" itemprop="description">{$product.description_short nofilter}</div>
          {/block}

          {block name='product_customization'}
            {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
          {/block}
          
          {block name='product_add_to_cart'}
            {include file='catalog/_partials/product-actions.tpl'}
          {/block}

          {block name='product_additional_info'}
            {include file='catalog/_partials/product-additional-info.tpl'}
          {/block}

          {block name='hook_display_reassurance'}
            {hook h='displayReassurance-wylaczony'}
          {/block}

          {block name='product_accordion'}
            {include file='catalog/_partials/product-accordion.tpl'}
          {/block}

          {block name='product_accessories'}
            {include file='catalog/_partials/product-accessories.tpl'}
          {/block}
        {/block}
      </div>
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          {block name='product_footer'}
            {hook h='displayFooterProduct' product=$product category=$category}
          {/block}

          {block name='product_images_modal'}
            {include file='catalog/_partials/product-images-modal.tpl'}
          {/block}
        {/block}
      </footer>
    {/block}

  </main>
{/block}
