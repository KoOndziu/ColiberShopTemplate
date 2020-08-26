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

{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}

  {hook h='displayPaymentTop'}

  {* used by javascript to correctly handle cart updates when we are on payment step (eg vouchers added) *}
  <div style="display:none" class="js-cart-payment-step-refresh"></div>

  {if !empty($display_transaction_updated_info)}
    <p class="cart-payment-step-refreshed-info">
      {l s='Transaction amount has been correctly updated' d='Shop.Theme.Checkout'}
    </p>
  {/if}

  {if $is_free}
    <p>{l s='No payment needed for this order' d='Shop.Theme.Checkout'}</p>
  {/if}
	
  <div class="payment-options grid {if $is_free}hidden-xs-up{/if}">
    {foreach from=$payment_options item="module_options"}
			{foreach from=$module_options item="option"}
				<label for="{$option.id}">
					<header>
						<span class="h2 payment-option-header">
							{$option.call_to_action_text}
              {if $option.logo}
								<img 
                  class="bank-logo"
									src="{$option.logo}" 
									alt="{$option.call_to_action_text}"
								>
							{/if}
						</span>
						<nav id="{$option.id}-container" class="payment-option clearfix">
							
							{* This is the way an option should be selected when Javascript is enabled *}
							<input
								class="ps-shown-by-js {if $option.binary} binary {/if}"
								id="{$option.id}"
								data-module-name="{$option.module_name}"
								name="payment-option"
								type="radio"
								required
								{if $selected_payment_option == $option.id || $is_free} checked {/if}
							>

							{* This is the way an option should be selected when Javascript is disabled *}
							<form method="GET" class="ps-hidden-by-js">
								{if $option.id === $selected_payment_option}
									{l s='Selected' d='Shop.Theme.Checkout'}
								{else}
									<button class="ps-hidden-by-js" type="submit" name="select_payment_option" value="{$option.id}">
										{l s='Choose' d='Shop.Theme.Actions'}
									</button>
								{/if}
							</form>
							
						</nav>
					</header>

					<div
						id="pay-with-{$option.id}-form"
						class="js-payment-option-form {if $option.id != $selected_payment_option} ps-hidden {/if}"
					>
						{if $option.form}
							{$option.form nofilter}
						{else}
							<form 
								class="payment-form" 
								method="POST" 
								action="{$option.action nofilter}" 
								style="display:none"
							>
								{foreach from=$option.inputs item=input}
									<input type="{$input.type}" name="{$input.name}" value="{$input.value}">
								{/foreach}
								<button id="pay-with-{$option.id}" type="submit"></button>
							</form>
						{/if}
					</div>
					
					{if $option.additionalInformation}
						<div
							id="{$option.id}-additional-information"
							class="js-additional-information_ALWAYS definition-list additional-information{if $option.id != $selected_payment_option} ps-hidden {/if}"
						>{$option.additionalInformation nofilter}</div>
					{/if}
				</label>
			{/foreach}
    {foreachelse}
      <p class="alert alert-danger">{l s='Unfortunately, there are no payment method available.' d='Shop.Theme.Checkout'}</p>
    {/foreach}
  </div>
  
  {if $show_final_summary}
    {include file='checkout/_partials/order-final-summary.tpl'}
  {/if}

  {if $conditions_to_approve|count}
    <p class="ps-hidden-by-js">
      {* At the moment, we're not showing the checkboxes when JS is disabled
         because it makes ensuring they were checked very tricky and overcomplicates
         the template. Might change later.
      *}
      {l s='By confirming the order, you certify that you have read and agree with all of the conditions below:' d='Shop.Theme.Checkout'}
    </p>

    <form id="conditions-to-approve" class="form-normal" method="GET">
      <ul class="list list-min-content">
        {foreach from=$conditions_to_approve item="condition" key="condition_name"}
          <li>
						<input  id    = "conditions_to_approve[{$condition_name}]"
										name  = "conditions_to_approve[{$condition_name}]"
										required
										type  = "checkbox"
										value = "1"
										class = "ps-shown-by-js"
						>
						<label 
							class="js-terms condition-label" 
							for="conditions_to_approve[{$condition_name}]"
							>{$condition nofilter}
						</label>
          </li>
        {/foreach}
      </ul>
    </form>
  {/if}

  <form id="payment-confirmation">

    <footer>
      <div class="ps-shown-by-js">
        <button type="submit" {if !$selected_payment_option} disabled {/if} class="icon-arrow-down-circle">
          {l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}
        </button>

        {if $show_final_summary}
          <ul class="list list-min-content">
            <li class="icon-exclamation">{l s='Please check your order before payment' d='Shop.Theme.Checkout'}</li>
            <li class="icon-exclamation js-alert-payment-conditions"><span>{l
                s='Please make sure you\'ve chosen a [1]payment method[/1] and accepted the [2]terms and conditions[/2].'
                sprintf=[
                  '[1]' => '<a href="#checkout-payment-step">',
                  '[/1]' => '</a>',
                  '[2]' => '<a href="#conditions-to-approve">',
                  '[/2]' => '</a>'
                ]
                d='Shop.Theme.Checkout'
              }</span>
            </li>
          </ul>
        {/if}
      </div>
      <div class="ps-hidden-by-js">
        {if $selected_payment_option and $all_conditions_approved}
          <label for="pay-with-{$selected_payment_option}">{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</label>
        {/if}
      </div>
    </footer>
  </form>

  {hook h='displayPaymentByBinaries'}

  {include file='checkout/checkout-cms-modal.tpl'}
{/block}
