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
  <div id="hook-display-before-carrier">
    {$hookDisplayBeforeCarrier nofilter}
  </div>

  <div class="delivery-options-list">
    {if $delivery_options|count}
      <form
        id="js-delivery"
        class="form-normal"
        data-url-update="{url entity='order' params=['ajax' => 1, 'action' => 'selectDeliveryOption']}"
        method="post"
      >
					{block name='delivery_options'}
						<div class="grid delivery-options">
							{foreach item=carrier key=carrier_id from=$delivery_options}
								<label style="order: {$carrier.position}" for="delivery_option_{$carrier.id}">
									<div class="header delivery-option">
										<span class="h2">
											{if $carrier.logo}
												<img 
													style="margin-right: .2em; max-height: 1em; max-width: 1em; vertical-align: inherit;" 
													src="{$carrier.logo}" 
													alt="{$carrier.name}"
												>
											{/if}
											{$carrier.name}
										</span>
										<nav>
											<input 
												type="radio" 
												name="delivery_option[{$id_address}]" 
												id="delivery_option_{$carrier.id}" 
												value="{$carrier_id}"
												{if $delivery_option == $carrier_id} checked{/if}
											>
										</nav>
									</div>
									<div 
										class="carrier-extra-content" 
										{if $delivery_option != $carrier_id}style="display:none;"{/if}
										>{$carrier.extraContent nofilter}
									</div>
									<div>
										{$carrier.delay}<br>
										{$carrier.price}
									</div>
								</label>
							{/foreach}
						</div>
					{/block}

        {if $recyclablePackAllowed}
          <section class="order-options-recyclable">
            <span>
              <label>
                <input type="checkbox" name="recyclable" value="1" {if $recyclable} checked {/if}>
                <span>{l s='I would like to receive my order in recycled packaging.' d='Shop.Theme.Checkout'}</span>
              </label>
            </span>
          </section>
        {/if}
        
        
        {if $gift.allowed}
          <section class="order-options-gift">
            <span>
              <label>
                <input class="js-gift-checkbox" type="checkbox" name="gift" value="1" {if $gift.isGift} checked {/if}>
                <span>{$gift.label}</span>
              </label>
            </span>
          </section>
          <section id="gift" class="order-options-gift">
            <label for="gift_message">{l s='If you\'d like, you can add a note to the gift:' d='Shop.Theme.Checkout'}</label>
            <textarea rows="2" cols="120" id="gift_message" name="gift_message">{$gift.message}</textarea>
          </section>
        {/if}
        
        <footer>
          <button 
            type="submit" 
            class="icon-arrow-down-circle continue" 
            name="confirmDeliveryOption" 
            value="1"
            >{l s='Continue' d='Shop.Theme.Actions'}
          </button>
        </footer>
      </form>
    {else}
      <ul class="list list-min-content">
        <li class="icon-exclamation">{l s='Unfortunately, there are no carriers available for your delivery address.' d='Shop.Theme.Checkout'}</li>
      </ul>
    {/if}
  </div>

  <div id="hook-display-after-carrier">
    {$hookDisplayAfterCarrier nofilter}
  </div>

  <div id="extra_carrier"></div>
{/block}

{block name='step_content_summary'}
  <div class="grid">
    <article>
      <header>
        <span class="h2">
          {if $delivery_options[$delivery_option].logo}
            <img style="margin-right: .2em; max-height: 1em; max-width: 1em; vertical-align: inherit;" src="{$delivery_options[$delivery_option].logo}" alt="{$delivery_options[$delivery_option].name}">
          {/if}
          {$delivery_options[$delivery_option].name}
        </span>
      </header>
      <div>
        <span class="carrier-delay">{$delivery_options[$delivery_option].delay}</span><br>
        <span title="{l s='Shipping cost' d='Shop.Theme.Checkout'}">{$delivery_options[$delivery_option].price}</span>
      </div>
    </article>
      
    {block name='recyclable'}
      {if $recyclable}
        <article>
          <header>
            <span class="h2">{l s='Delivery' d='Shop.Pdf'}</span>
          </header>
          <div
            class="icon-bag"
            >{l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}
          </div>
        </article>
      {/if}
		{/block}
      
    {block name='gift'}
			{if $gift.isGift}
				<article>
					<header>
						<span class="h2">{l s='Gift' d='Shop.Theme.Checkout'}</span>
					</header>
					<div
						class="icon-present"
						>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}
          </div>
					<div
						class="icon-envelope-letter"
						title="{l s='Message' d='Shop.Theme.Customeraccount'}"
						>"{$gift.message nofilter}"
          </div>
				</article>
			{/if}
		{/block}
  </div>
{/block}