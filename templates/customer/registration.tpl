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

{extends file='page.tpl'}

{block name='page_header_container'}{/block}

{block name='page_content'}
  <section class="page-content page-authentication">
    {block name='register_form_container'}
      <header>
        <h1 class="h1">{l s='Create an account' d='Shop.Theme.Customeraccount'}</h1>
      </header>
      <p>{l s='Already have an account?' d='Shop.Theme.Customeraccount'} <a href="{$urls.pages.authentication}">{l s='Log in instead!' d='Shop.Theme.Customeraccount'}</a></p>

      {$hook_create_account_top nofilter}
      <section class="register-form">
        {render file='customer/_partials/customer-form.tpl' ui=$register_form}
      </section>
    {/block}
  </section>
{/block}
