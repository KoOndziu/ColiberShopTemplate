{extends file='customer/page.tpl'}

{block name='head_seo_title'}
	{l s='My alerts' d='Modules.Mailalerts.Shop'}
{/block}

{block name='breadcrumb_item_fixbug'}
	<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
		<a itemprop="item" href="{$urls.pages.my_account}">
			<span itemprop="name">{l s='Your account' d='Shop.Theme.Customeraccount'}</span>
		</a>
		<meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
	</li>
{/block}

{block name='page_title'}
	{l s='My alerts' d='Modules.Mailalerts.Shop'}
{/block}

{block name='page_content'}
  {if $mailAlerts}
		<p>{l s='Powiadom mnie kiedy będzie dostępny' d='Modules.Mailalerts.Shop'}:</p>
		<ul class="cart-overview">
			{foreach from=$mailAlerts item=mailAlert}
				<li>
					{include file='catalog/_partials/miniatures/product-line.tpl' product=$mailAlert}
					{block name='product_line_actions'}
						<section class="product-actions">
							<section>
								<a 
									href="#"
									class="js-remove-email-alert icon-trash"
									rel="js-id-emailalerts-{$mailAlert.id_product|intval}-{$mailAlert.id_product_attribute|intval}"
									data-url="{url entity='module' name='ps_emailalerts' controller='actions' params=['process' => 'remove']}"
									rel="nofollow"
									title="{l s='Remove' d='Shop.Theme.Actions'}"
								></a>
							</section>
						</section>
					{/block}
				</li>
			{/foreach}
		</ul>
  {else}
    <p>{l s='No mail alerts yet.' d='Modules.Mailalerts.Shop'}</p>
  {/if}
{/block}
