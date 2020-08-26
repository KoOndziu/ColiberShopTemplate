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
