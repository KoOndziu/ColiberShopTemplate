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

{block name="sidenav"}
  <li class="{if $page.page_name eq 'my-account'}active{/if}">
    <a 
      class="button submit icon-user"
      href="{$urls.pages.my_account}"
      title="{l s='Your account' d='Shop.Theme.Customeraccount'}"
    ></a>
  </li>
{/block}
  
{block name='page_header_container'}
  <header class="page-header content">
    {block name='page_header'}
      <h1>{block name='page_title'}{/block}</h1>
		{/block}
  </header>
{/block}

{block name='page_footer'}
{/block}
