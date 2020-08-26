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

{block name='login_form'}

  {block name='login_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  <form id="login-form" action=" {block name='login_form_actionurl'}{$action}{/block}" method="post">

		{block name='form_fields'}
			{foreach from=$formFields item="field"}
				{block name='form_field'}
					{form_field field=$field}
				{/block}
			{/foreach}
		{/block}

		
		<input type="hidden" name="submitLogin" value="1">
		
		<footer>
			{block name='form_buttons'}
				<a 
					class="lost_password button icon-support" 
					href="{$urls.pages.password}" rel="nofollow"
					>{l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
				</a>

				<button 
					class="icon-login" 
					data-link-action="sign-in" 
					type="submit"
					>{l s='Sign in' d='Shop.Theme.Actions'}
				</button>
			{/block}
		</footer>

  </form>
{/block}
