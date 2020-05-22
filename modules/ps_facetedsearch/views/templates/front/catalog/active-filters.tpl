<section id="js-active-search-filters" class="{if $activeFilters|count}active_filters{else}hide{/if}">
  {if $activeFilters|count}		
    <ul class="active-list">
			<li>
        <button
          class="icon-trash js-search-filters-clear-all"
          id="_desktop_search_filters_clear_all" 
          data-search-url="{$clear_all_link}"
          >{l s='Clear all' d='Shop.Theme.Actions'}
        </button>
			</li>
      {foreach from=$activeFilters item="filter"}
        {block name='active_filters_item'}
          <li class="filter-block">
						<a 
              class="button icon-trash js-search-link" 
              href="{$filter.nextEncodedFacetsURL}"
              >{$filter.label}
            </a>
          </li>
        {/block}
      {/foreach}
    </ul>
  {/if}
</section>
