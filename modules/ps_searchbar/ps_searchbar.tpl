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