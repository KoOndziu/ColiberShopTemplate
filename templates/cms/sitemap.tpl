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

{extends file='page.tpl'}

{block name='page_title'}
  {l s='Sitemap' d='Shop.Theme.Global'}
{/block}

{block name='page_content_container'}
  <div id="sitemap-tree" class="sitemap">
    <div class="tree-top">
      <a href="{$urls.base_url}" title="{$shop.name}"></a>
    </div>
    <ul class="tree">
      {foreach $sitemap as $item}
        {if isset($item.children)}
          {foreach $item.children as $child}
            {include file='cms/_partials/sitemap-tree-branch.tpl' node=$child}
          {/foreach}
        {/if}
      {/foreach}
    </ul>
  </div>
{/block}
