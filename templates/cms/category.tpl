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
  {$cms_category.name}
{/block}

{block name='page_content'}
  {block name='cms_sub_categories'}
    {if $sub_categories}
      <p>{l s='List of subcategories in %category_name%:' sprintf=['%category_name%' => $cms_category.name] d='Shop.Theme.Global'}</p>
      <ul>
        {foreach from=$sub_categories item=sub_category}
          <li><a href="{$sub_category.link}">{$sub_category.name}</a></li>
        {/foreach}
      </ul>
    {/if}
  {/block}

  {block name='cms_sub_pages'}
    {if $cms_pages}
      <p>{l s='List of pages in %category_name%:' sprintf=['%category_name%' => $cms_category.name] d='Shop.Theme.Global'}</p>
      <ul>
        {foreach from=$cms_pages item=cms_page}
          <li><a href="{$cms_page.link}">{$cms_page.meta_title}</a></li>
        {/foreach}
      </ul>
    {/if}
  {/block}
{/block}
