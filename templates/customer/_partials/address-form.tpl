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

{block name="address-form"}

  <div class="js-address-form">
    {block name="address_form_url"}
      <form
        method="POST"
        action="{url entity='address' params=['id_address' => $id_address]}"
        data-id-address="{$id_address}"
        data-refresh-url="{url entity='address' params=['ajax' => 1, 'action' => 'addressForm']}"
      >
    {/block}

      {include file='_partials/form-errors.tpl' errors=$errors['']}

      {block name="address-form-fields"}
        {block name='form_fields'}
          {foreach from=$formFields item="field"}
            {block name='form_field'}
              {form_field field=$field}
            {/block}
          {/foreach}
        {/block}
      {/block}

      {block name="address-form-footer"}
        <footer class="form-footer">
          <input type="hidden" name="submitAddress" value="1">
          {block name='form_buttons'}
            <button class="icon-pencil" type="submit">{l s='Save' d='Shop.Theme.Actions'}</button>
          {/block}
        </footer>
      {/block}
    </form>
  </div>
      
{/block}
