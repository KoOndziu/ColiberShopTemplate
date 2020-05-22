<div id="search_widget" class="search-widget" data-search-controller-url="{$search_controller_url}">
  <form 
		class="form-one-input input-text" 
		method="get" 
		action="{$search_controller_url}"
	>
		<input type="hidden" name="controller" value="search">
		<input type="text" name="s" value="{$search_string}" placeholder="{l s='Search' d='Modules.Searchbar.Shop'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
		<button 
			class="icon-magnifier" 
			type="submit"
			title="{l s='Search' d='Modules.Searchbar.Shop'}"
		></button>
	</form>
</div>