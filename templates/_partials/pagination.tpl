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

<nav class="pagination">
  {block name='pagination_summary'}
		<p>{l 
      s='Showing %from%-%to% of %total% item(s)'
      sprintf=['%from%' => $pagination.items_shown_from ,'%to%' => $pagination.items_shown_to, '%total%' => $pagination.total_items] 
      d='Shop.Theme.Catalog'
    }</p>
  {/block}

  {block name='pagination_page_list'}
		<ul>
			{if $pagination.current_page === 1}
				<li><a href="##" class="button icon-arrow-left disabled"></a></li>
			{/if}
			{foreach from=$pagination.pages item="page"}
				<li {if $page.current}class="current"{/if}>
					{if $page.type === 'spacer'}
						<span class="spacer">&hellip;</span>
					{elseif $page.type === 'previous'}
						<a
							rel="prev"
							href="{$page.url}"
							class="button icon-arrow-left {['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}"
							></a>
					{elseif $page.type === 'next'}
						<a
							rel="next"
							href="{$page.url}"
							class="button icon-arrow-right {['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}"
							></a>
					{else}
						<a
							rel="nofollow"
							href="{$page.url}"
							class="button icon-number {['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}"
							data-number="{$page.page}"
            ></a>
					{/if}
				</li>
			{/foreach}
			{if $pagination.current_page === $pagination.pages_count}
				<li><a href="##" class="button icon-arrow-right disabled"></a></li>
			{/if}
		</ul>
  {/block}

</nav>
