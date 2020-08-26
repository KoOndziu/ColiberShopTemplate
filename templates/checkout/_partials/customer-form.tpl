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

{extends "customer/_partials/customer-form.tpl"}

{block "form_buttons"}
  <button 
    class="icon-arrow-down-circle continue" 
    name="continue" 
    data-link-action="register-new-customer" 
    type="submit" 
    value="1"
    >{l s='Continue' d='Shop.Theme.Actions'}
  </button>
{/block}
