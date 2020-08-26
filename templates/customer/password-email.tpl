{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Reset your password' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <form class="password-form" action="{block name='form_new_password_actionurl'}{$urls.pages.password}{/block}" method="post">

    {block name='form_new_password_header'}
      <header>
        <p>{l s='Please enter the email address you used to register. You will receive a temporary link to reset your password.' d='Shop.Theme.Customeraccount'}</p>
      </header>
    {/block}

    {block name='form_new_password_form_fields'}
      {if isset($smarty.post.email)}
        {assign var=val value={$smarty.post.email|stripslashes}}
      {else}
        {assign var=val value=''}
      {/if}
      {foreach 
        from=[
          [
            'type' => 'email',
            'errors' => null,
            'label' => {l s='Email' d='Shop.Forms.Labels'},
            'name' => 'email',
            'placeholder' => {l s='Email' d='Shop.Forms.Labels'},
            'value' => {$val},
            'maxLength' => 0,
            'required' => 1
          ]
        ] 
        item="field"
      }
        {block "form_field"}
          {form_field field=$field}
        {/block}
      {/foreach}
    {/block}

    {block name='form_new_password_footer'}
      <footer class="form-footer">
        <a 
          class="button icon-action-undo"
          href="{$urls.pages.authentication}"
          >{l s='Back to Login' d='Shop.Theme.Actions'}
        </a>
        <button 
          class="icon-paper-plane" 
          type="submit" 
          name="submit"
          >{l s='Send reset link' d='Shop.Theme.Actions'}
        </button>
      </footer>
    {/block}
    
  </form>
{/block}