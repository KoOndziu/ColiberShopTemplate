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
        <div class="header-top">
          <div class="header-shortcuts">
            <div class="header-back">
              <a 
                class="button icon-arrow-left" 
                href="/" 
                data-href="javascript: window.history.back()"
                rel="nofollow"
                title=""
              ></a>
            </div>
            <div class="header-title">
              <h1 class='h2'>{block name='title'}{/block}</h1>
            </div>
          </div>
        </div>
        
        {block name='notifications'}
          <aside id="notifications" class="notifications">
            {include file='_partials/notifications.tpl' closable=true}
            {hook h='displayGDPRConsent'}
          </aside>
        {/block}
      </header>
    {/block}

    {block name='main'}
      <main>
        {hook h="displayMainTop"}
        {block name='content'}{/block}
        {hook h="displayMainBottom"}          
      </main>
    {/block}

    {block name='footer'}
      <footer></footer>
    {/block}

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}
  </body>
</html>
