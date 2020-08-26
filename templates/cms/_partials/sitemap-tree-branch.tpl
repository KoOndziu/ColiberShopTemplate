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

{block name='sitemap_item'}
  <li>
    <a id="{$node.id}" href="{$node.url}" title="{$node.label}">{$node.label}</a>
    {if isset($node.children) && $node.children|@count > 0}
      <ul>
        {foreach $node.children as $child}
          {include file='cms/_partials/sitemap-tree-branch.tpl' node=$child}
        {/foreach}
      </ul>
    {/if}
  </li>
{/block}
