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

    <footer>
      {block name='footer'}
        {include file='_partials/footer.tpl'}
      {/block}
    </footer>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}

  </body>
</html>
