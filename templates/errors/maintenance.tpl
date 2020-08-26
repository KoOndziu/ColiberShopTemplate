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

  <main id="main">

    {block name='page_header_container'}
      <header class="page-header">
        {block name='page_header_logo'}
          <div class="logo"><img src="{$shop.logo}" alt="logo"></div>
        {/block}
        {block name='hook_maintenance'}
          {$HOOK_MAINTENANCE nofilter}
        {/block}
        {block name='page_header'}
          <h1>{block name='page_title'}{l s='We\'ll be back soon.' d='Shop.Theme.Global'}{/block}</h1>
        {/block}
      </header>
    {/block}

    {block name='page_content_container'}
      <section id="content" class="page-content page-maintenance">
        {block name='page_content'}
          {$maintenance_text nofilter}
        {/block}
      </section>
    {/block}

    {block name='page_footer_container'}

    {/block}

  </main>

{/block}
