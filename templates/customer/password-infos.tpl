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

{block name='page_title'}
  {l s='Reset your password' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <form class="password-form">
    <header>
      {foreach $successes as $success}
        <p>{$success}</p>
      {/foreach}
    </header>
    <footer>
      <a 
        class="button submit icon-action-undo"
        href="{$urls.pages.authentication}"
        >{l s='Back to Login' d='Shop.Theme.Actions'}
      </a>
    </footer>
  </form>
{/block}
