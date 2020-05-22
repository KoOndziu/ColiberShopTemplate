{assign var="modal" value=[]}
{block name='modal_attr'}{/block}

<div
	id="{$modal.id}"
	class="modal {$modal.id} {if isset($modal.class)}{$modal.class}{/if} fade" 
	tabindex="-1" 
	role="dialog" 
	aria-hidden="true"
  data-dismiss="modal"
	{if isset($modal.dru)} data-refresh-url="{$modal.dru}" {/if}
	>
  <div 
		class="modal-dialog" 
		role="document"
		>
		<div class="modal-content">
			<header class="modal-header">
				<span class="modal-title h2">
					{block name='modal_title'}
						<!-- Modal title -->
					{/block}
				</span>
				<button 
					type="button" 
					class="close icon-close" 
					data-dismiss="modal" 
					aria-label="{l s="Close" d="Shop.Theme.Actions"}"
					titlle="{l s="Close" d="Shop.Theme.Actions"}"
				></button>
			</header>
			<div class="modal-body">{block name='modal_body'}{/block}</div>
			<footer class="modal-footer">{block name='modal_footer'}{/block}</footer>
		</div>
	</div>
</div>