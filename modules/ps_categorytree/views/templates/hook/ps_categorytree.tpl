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

{function name="categories" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
      <ul>
        {foreach from=$nodes item=node}
          <li>
            <a href="{$node.link}">{$node.name}</a>
            {categories nodes=$node.children depth=$depth+1}
          </li>
        {/foreach}
      </ul>
    {/if}
  {/strip}
{/function}

<nav class="category-tree">
  {categories nodes=$categories.children}
</nav>
