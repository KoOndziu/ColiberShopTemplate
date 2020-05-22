<!doctype html>
<html lang="{$language.iso_code}">

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}">

    <header id="header">
			{block name='hook_checkout_summary_top'}
				{hook h='displayCheckoutSummaryTop'}
			{/block}
      {block name='header'}
        {include file='checkout/_partials/checkout-header.tpl'}
      {/block}
      
      <aside id="notifications" class="notifications">
        {block name='notifications'}
          {include file='_partials/notifications.tpl'}
        {/block}
      </aside>
    </header>

    <main class="content">
      {block name='content'}        
        {block name='checkout-process'}
          {render file='checkout/checkout-process.tpl' ui=$checkout_process}
        {/block}
      {/block}
    </main>

    <footer id="footer" class="page-footer">
      {block name='footer'}
        {include file='checkout/_partials/checkout-footer.tpl'}
      {/block}
    </footer>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

  </body>

</html>
