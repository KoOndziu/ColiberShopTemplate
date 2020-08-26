{extends file='_partials/modal.tpl'}

{block name='modal_attr'}
	{assign var="modal" value=['id' => 'sort-orders-modal', 'class' => 'modal-right']}
{/block}

{block name='modal_title'}
	{l s='Sort by:' d='Shop.Theme.Global'}
{/block}

{block name='modal_body'}
  {block name='sort_orders'}
    {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
  {/block}
{/block}

{block name='modal_footer'}
{/block}