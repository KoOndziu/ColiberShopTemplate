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
        {block name='modal_title_container'}
          <span class="modal-title h2">
            {block name='modal_title'}
              <!-- Modal title -->
            {/block}
          </span>
        {/block}
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