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

{extends file='customer/page.tpl'}

{block name='notifications_content'}
	{if $message}
		<ul class="alert alert-success notifications notification-warning content">
			<li class="message icon-exclamation">{$message}</li>
		</ul>
	{/if}
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
	{l s='My stored cards' mod='przelewy24'} 
	<div class="p24-register-card-wrapper"
			 data-dictionary='{
			 "cardHolderLabel":"{l s='Cardholder name' mod='przelewy24'}",
			 "cardNumberLabel":"{l s='Card number' mod='przelewy24'}",
			 "cvvLabel":"{l s='cvv' mod='przelewy24'}",
			 "expDateLabel":"{l s='Expiry date' mod='przelewy24'}",
			 "payButtonCaption":"{l s='Save card data' mod='przelewy24'}",
			 "description":"{l s='Register card' mod='przelewy24'}"
			 }'
			 data-card-action="cardRegister"
			 data-successCallback="registerCardInPanelSuccess"
			 data-failureCallback="registerCardInPanelFailure"
			 data-action-register-card-confirm="{$link->getModuleLink('przelewy24', 'ajaxRegisterCardConfirm', [], true)|escape:'html'}"
			 data-action-register-card-form="{$link->getModuleLink('przelewy24', 'ajaxRegisterCardForm', [], true)|escape:'html'}">
		<div class="p24-register-card-row">
			<div id="p24-register-card-form" class="p24-register-card-form"></div>
			<a 
				class="p24-add-credit-card icon-plus"
				href="#" 
				onclick="showPayJsPopup();
						hideRegisterCardButton();"
				title="{l s='Add credit card' mod='przelewy24'}">
			</a>
		</div>
	</div>
{/block}

{block name='page_content'}

	{if $customer_cards}
		<p>{l s='Your credit cards are listed below.' mod='przelewy24'}</p>
		<div class="p24-account-cards grid">
			<article class="" data-translate-error="{l s='Something wrong' mod='przelewy24'}">
				<span class="h2">{l s='Memorize payment cards, which I pay' mod='przelewy24'}</span>
				<form class="p24-account-card-form form-normal" action="" method="post">
					<div 
						class="icon-credit-card"
						for="remember_credit_cards"
						>{if $remember_customer_cards}{l s='Yes' d='Shop.Theme.Global'}{else}{l s='No' d='Shop.Theme.Global'}{/if}
					</div>
					<input type="hidden" name="remember_cc_post" value="1">
					<input 
						type="hidden"
						name="remember_credit_cards" 
						value="{if !$remember_customer_cards}1{else}0{/if}"
						>
					<button
						type="submit" 
						name="submit" 
						value="submit"
						>{l s='Change' mod='przelewy24'}
					</button>
				</form>
			</article>
			{foreach $customer_cards as $ccard}
				<article class="hide-p24-ccbox">
					<header>
						<span class="h2">{$ccard.card_type}</span>
						<nav>
							<form 
								class="form-normal form-inline"
								action="" 
								method="post"
								onsubmit="return confirm('{l s='Are you sure?' js=1 mod='przelewy24'}');"
								>
								<button 
									type="submit" 
									name="submit" 
									class="icon-trash" 
									value="submit"
									title="{l s='Delete' mod='przelewy24'}"
								></button>
								<input type="hidden" name="remove_card" value="{$ccard.id}">
							</form>
						</nav>
					</header>
					<p>
						{$ccard.mask}<br>
						{$ccard.expires|substr:0:2}/{$ccard.expires|substr:2:2}
					</p>
				</article>
			{/foreach}
		</div>
	{else}
		<p>{l s='Credit cards not found' mod='przelewy24'}</p>.
	{/if}

	<div id="P24FormAreaHolder" onclick="hidePayJsPopup();
			showRegisterCardButton();" style="display: none">
		<div onclick="arguments[0].stopPropagation();" id="P24FormArea" class="popup"
				 style="visibility: hidden"></div>
		<div id="p24-card-loader"></div>
		<div id="p24-card-alert" style="display: none"></div>
	</div>
{/block}