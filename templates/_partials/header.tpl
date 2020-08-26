{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_top'}
  <div class="header-top">
    
    {block name='header_logo'}
      <div class="header-logo desktop-only">
        <a class="logo" href="{$urls.base_url}" title="{$shop.name}">
          <img src="{$shop.logo}" alt="{$shop.name}">
        </a>
      </div>
    {/block}
    
    {block name='header_nav'}
      <div class="header-nav">
        <nav class="menu nav-main no-scroll-on-mobile">
          {hook h='displayTop'}
        </nav>
      </div>
    {/block}
    
    <div class="header-shortcuts">
      <div class="header-logo mobile-only">
        <a 
          class="button icon-diamond"
          href="{$urls.base_url}"
          rel="nofollow" 
          title="{$shop.name}" 
        ></a><!--<img src="{$shop.favicon}" alt="{$shop.name}">-->
      </div>
      {if !empty({hook h='displaySearch'})}
        <div class="search">
          <a
            class="button icon-magnifier js-open-modal"
            href="/"
            rel="nofollow
            "title="search"
          ></a>
          {include file='module:ps_searchbar/ps_searchbar_modal.tpl'}
        </div>
      {/if}
      {hook h='displayNav'}
    </div>

    
    {hook h='displayNavFullWidth'}
  </div>
	
{/block}