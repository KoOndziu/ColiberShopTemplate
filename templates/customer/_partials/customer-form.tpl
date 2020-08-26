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

{block name='customer_form'}

  {block name='customer_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  <form action="{block name='customer_form_actionurl'}{$action}{/block}" id="customer-form" method="post">

    {block "form_fields"}
      {foreach from=$formFields item="field"}
        {block "form_field"}
          {form_field field=$field}
        {/block}
      {/foreach}
    {/block}

    {block name='customer_form_footer'}
      <footer class="form-footer">
        <input type="hidden" name="submitCreate" value="1">
        {block "form_buttons"}
          <button class="icon-pencil" data-link-action="save-customer" type="submit">
            {l s='Save' d='Shop.Theme.Actions'}
          </button>
        {/block}
      </footer>
    {/block}

  </form>
{/block}
