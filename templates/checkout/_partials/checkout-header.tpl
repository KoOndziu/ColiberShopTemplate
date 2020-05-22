{extends file='_partials/header.tpl'}

{block name='header_banner'}{/block}
{block name='header_nav_left'}
	<div class="header-nav-mobile">
		<a class="icon-menu" href="#menubox" title="menu"></a>
		<a 
			class="icon-arrow-left" 
			href="{$urls.base_url}" 
			title="{l s='Continue shopping' d='Shop.Theme.Actions'}">
		</a>
	</div>
{/block}
{block name='header_nav_right'}
	<div class="header-shortcuts"></div>
{/block}
{block name='header_nav'}{/block}