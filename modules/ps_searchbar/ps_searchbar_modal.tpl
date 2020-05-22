{extends file='_partials/modal.tpl'}

{block name='modal_attr'}
	{assign var="modal" value=['id' => 'ps-searchbar-modal', 'class' => 'modal-top', 'data-search-controller-url' => $search_controller_url]}
{/block}

{block name='modal_title'}
	{l s='Search' d='Modules.Searchbar.Shop'}
{/block}

{block name='modal_body'}
	{hook h='displaySearch'}
{/block}

{block name='modal_footer'}
{/block}