{extends file='_partials/modal.tpl'}

{block name='modal_attr'}
	{assign var="modal" value=['id' => 'header-modal', 'class' => 'modal-left']}
{/block}

{block name='modal_title'}
	menu
{/block}

{block name='modal_body'}
	<nav class="menu">
		{hook h='displayTop'}
	</nav>
{/block}

{block name='modal_footer'}
{/block}