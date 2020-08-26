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

<!doctype html>
<html lang="{$language.locale}">

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}">

    {block name='header'}
      <header id="header">
        {block name='hook_after_body_opening_tag'}
          {hook h='displayAfterBodyOpeningTag'}
        {/block} 

        {include file='_partials/header.tpl'}
        
        {block name='sidenav_container'}
          <ul class="sidenav">
            {block name='sidenav'}{/block}
            <li><span class='button icon-bulb toggle-dark-mode' title="dark mode"></span></li>
            <li><a href="#" class="button submit icon-arrow-up-circle"></a></li>
          </ul>
        {/block}

        {block name='notifications'}
          <aside id="notifications" class="notifications">
            {include file='_partials/notifications.tpl' closable=true}
            {hook h='displayGDPRConsent'}
          </aside>
        {/block}
      </header>
    {/block}

    {block name='main'}
      <aside>
        {block name='aside'}{/block}
      </aside>

      <main>
        {hook h="displayMainTop"}
        {block name='content'}{/block}
        {hook h="displayMainBottom"}          
      </main>
    {/block}

    {block name='footer'}
      <footer>
        {include file='_partials/footer.tpl'}
      </footer>
    {/block}

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}

  </body>
</html>
