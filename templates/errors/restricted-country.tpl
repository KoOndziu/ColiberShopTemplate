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

{extends file='layouts/layout-error.tpl'}

{block name='content'}

  <section id="main">

    {block name='page_header_container'}
      <header class="page-header">
        {block name='page_header'}
          {block name='page_header_logo'}<div class="logo"><img src="{$shop.logo}" alt="logo"></div>{/block}
          <h1>{block name='page_title'}{$shop.name}{/block}</h1>
        {/block}
      </header>
    {/block}

    {block name='page_content_container'}
      <section id="content" class="page-content page-restricted">
        {block name='page_content'}
          <h2>{l s='403 Forbidden' d='Shop.Theme.Global'}</h2>
          <p>{l s='You cannot access this store from your country. We apologize for the inconvenience.' d='Shop.Theme.Global'}</p>
        {/block}
      </section>
    {/block}

    {block name='page_footer_container'}

    {/block}

  </section>

{/block}
