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

{extends file='customer/_partials/login-form.tpl'}

{block name='form_buttons'}
  <button 
    type="submit" 
    class="icon-arrow-down-circle continue" 
    data-link-action="sign-in" 
    name="continue" 
    value="1"
    >{l s='Continue' d='Shop.Theme.Actions'}
  </button>
{/block}
