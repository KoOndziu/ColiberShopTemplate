<nav class="pagination">
  {block name='pagination_summary'}
		{$from = ($pagination.items_shown_from-1)*100/$pagination.total_items }
		{$to = ($pagination.items_shown_to)*100/$pagination.total_items }
    <div 
			class="pagination_summary"
			style="background: 
			radial-gradient(var(--color-bcgr) 58px, transparent 60px), conic-gradient( var(--color-scnd) {$from}%,	currentColor {$from}% {$to}%, var(--color-scnd) {$to}%)"
			>
			<span>{l 
				s='Showing %from%-%to% of %total% item(s)'
				sprintf=['%from%' => $pagination.items_shown_from ,'%to%' => $pagination.items_shown_to, '%total%' => $pagination.total_items] 
				d='Shop.Theme.Catalog'
				}</span>
		</div>
  {/block}

  {block name='pagination_page_list'}
		<ul>
			{if $pagination.current_page === 1}
				<li>
					<a href="##" class="icon-arrow-left disabled"></a>
				</li>
			{/if}
			{foreach from=$pagination.pages item="page"}
				<li {if $page.current} class="current" {/if}>
					{if $page.type === 'spacer'}
						<span class="spacer">&hellip;</span>
					{elseif $page.type === 'previous'}
						<a
							rel="prev"
							href="{$page.url}"
							class="icon-arrow-left {['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}"
							></a>
					{elseif $page.type === 'next'}
						<a
							rel="next"
							href="{$page.url}"
							class="icon-arrow-right {['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}"
							></a>
					{else}
						<a
							rel="nofollow"
							href="{$page.url}"
							class="{['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}"
							>
							{$page.page}
						</a>
					{/if}
				</li>
			{/foreach}
			{if $pagination.current_page === $pagination.pages_count}
				<li>
					<a href="##" class="icon-arrow-right disabled"></a>
				</li>
			{/if}
		</ul>
  {/block}

</nav>
