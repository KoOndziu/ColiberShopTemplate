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

<ol 
	itemscope 
	itemtype="http://schema.org/BreadcrumbList" 
	class="breadcrumb" 
	data-depth="{$breadcrumb.count}">
  {foreach from=$breadcrumb.links item=path name=breadcrumb}
		{block name='breadcrumb_item'}
			<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
				<a itemprop="item" href="{$path.url}">
					<span itemprop="name">{$path.title}</span>
				</a>
				<meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
			</li>
		{/block}
  {/foreach}
	{block name='breadcrumb_item_fixbug'}{/block}
</ol>