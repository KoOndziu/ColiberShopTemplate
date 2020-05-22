{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_top'}
  <div class="header-top">
    
    {block name='header_logo'}
      <div class="header-logo">
        <a class="logo" href="{$urls.base_url}" title="{$shop.name}">
          <img src="{$shop.logo}" alt="{$shop.name}">
        </a>
      </div>
    {/block}
    
    {block name='header_nav'}
      <div class="header-nav">
        <nav class="menu">
          {hook h='displayTop'}
        </nav>
      </div>
    {/block}
		
		{block name='header_shortcuts'}
      <div class="header-shortcuts">
				<div class="hamburger-menu">
					<a 
						class="button icon-menu js-open-modal"
						href="#menubox" 
						rel="nofollow" 
						title="menu" 
					></a>
          {include file='_partials/header_modal.tpl'}
				</div>
				<div class="start-page">
					<a 
						class="button icon-diamond"
						href="{$urls.base_url}"
						rel="nofollow" 
						title="{$shop.name}" 
					></a>
				</div>
        <div class="search-mobile">
          <a
            class="button icon-magnifier js-open-modal"
            href="/"
            rel="nofollow
            "title="search"
          ></a>
          {include file='module:ps_searchbar/ps_searchbar_modal.tpl'}
        </div>
        <div class="search-desktop">
          {hook h='displaySearch'}
        </div>
        {hook h='displayNav'}
      </div>
    {/block}
    
    {hook h='displayNavFullWidth'}
  </div>
	
{/block}