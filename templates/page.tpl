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

{extends file=$layout}

{block name='aside'}{/block}

{block name='content'}

    {block name='page_header_container'}
      <header class="page-header content">
        {block name='page_header'}
          <h1>{block name='page_title'}{$page.meta.title}{/block}</h1>
        {/block}
      </header>
    {/block}

    {block name='page_content_container'}
      <section id="content" class="page-content content">
        {block name='page_content'}{/block}
      </section>
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer content">
        {block name='page_footer'}{/block}
      </footer>
    {/block}

{/block}
