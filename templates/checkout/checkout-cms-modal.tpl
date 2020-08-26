{extends file='_partials/modal.tpl'}

{block name='modal_attr'}
	{assign var="modal" value=[
			'id' => "modal",
			'class' => 'modal modal-bottom'
	]}
{/block}

{block name='modal_title'}
  <span class="h2" itemprop="name"></span>
{/block}

{block name='modal_body'}
  <div class="js-modal-content content" style="min-height: 100px;"></div>
{/block}

{block name='modal_footer'}{/block}