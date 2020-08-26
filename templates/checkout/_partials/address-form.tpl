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

{extends file='customer/_partials/address-form.tpl'}

{block name='form_field'}
  {if ($field.name eq "alias") and $customer.is_guest}
    {* we don't ask for alias here *}
  {else}
    {$smarty.block.parent}
  {/if}
{/block}

{block name="address_form_url"}
  <form
    method="POST"
    action="{url entity='order' params=['id_address' => $id_address]}"
    data-id-address="{$id_address}"
    data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'addressForm']}"
  >
{/block}

{block name='form_fields' append}
  <input type="hidden" name="saveAddress" value="{$type}">
  {if $type === "delivery"}
    <span>
    <label>
      <input  name    = "use_same_address"
              type    = "checkbox"
              value   = "1"
              {if $use_same_address} checked {/if}
      >
      {l s='Use this address for invoice too' d='Shop.Theme.Checkout'}
    </label>
    </span>
  {/if}
{/block}

{block name='form_buttons'}
  {if !$form_has_continue_button}
    <a 
      class="button icon-close"
      href="{url entity='order' params=['cancelAddress' => {$type}]}"
    >{l s='Cancel' d='Shop.Theme.Actions'}</a>
    <button 
      type="submit"
      class="icon-check"
      >{l s='Save Address' d='Shop.Theme.Actions'}
    </button>
  {else}
    {if $customer.addresses|count > 0}
      <a 
        class="button icon-close"
        href="{url entity='order' params=['cancelAddress' => {$type}]}"
      >{l s='Cancel' d='Shop.Theme.Actions'}</a>
    {/if}
    <button 
      type="submit" 
      class="icon-arrow-down-circle continue" 
      name="confirm-addresses" 
      value="1"
      >{l s='Continue' d='Shop.Theme.Actions'}
    </button>
  {/if}
{/block}
