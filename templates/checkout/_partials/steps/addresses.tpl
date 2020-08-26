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
  <div class="js-address-form">
    
    {if $show_delivery_address_form}
      <section id="delivery-address">
        <h3>{l s='Shipping Address' d='Shop.Theme.Checkout'}{if $use_same_address} / {l s='Your Invoice Address' d='Shop.Theme.Checkout'}{/if}</h3>
        {render file                      = 'checkout/_partials/address-form.tpl'
                ui                        = $address_form
                use_same_address          = $use_same_address
                type                      = "delivery"
                form_has_continue_button  = $form_has_continue_button
        }
      </section>
    {/if}
    {if $show_invoice_address_form}
      <section id="invoice-address">
        <h3>{l s='Your Invoice Address' d='Shop.Theme.Checkout'}</h3>
        {render file                      = 'checkout/_partials/address-form.tpl'
                ui                        = $address_form
                use_same_address          = $use_same_address
                type                      = "invoice"
                form_has_continue_button  = $form_has_continue_button
        }
      </section>
    {/if}
    
    <form
      method="POST"
      action="{$urls.pages.order}"
      data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'addressForm']}"
    >

      {if !$show_delivery_address_form and $customer.addresses|count > 0}
        <h3>
          <span>{l s='Shipping Address' d='Shop.Theme.Checkout'}{if $use_same_address} / {l s='Your Invoice Address' d='Shop.Theme.Checkout'}{/if}</span>
          <a 
            class="button icon-plus"
            href="{$new_address_delivery_url}" 
            title="{l s='add new address' d='Shop.Theme.Actions'}"
          ></a>
        </h3>
        <div id="delivery-addresses" class="address-selector js-address-selector">
          {include  file        = 'checkout/_partials/address-selector-block.tpl'
                    addresses   = $customer.addresses
                    name        = "id_address_delivery"
                    selected    = $id_address_delivery
                    type        = "delivery"
                    interactive = !$show_delivery_address_form and !$show_invoice_address_form
          }
        </div>

        {if isset($delivery_address_error)}
          <p class="alert alert-danger js-address-error" name="alert-delivery" id="id-failure-address-{$delivery_address_error.id_address}">{$delivery_address_error.exception}</p>
        {else}
          <p class="alert alert-danger js-address-error" name="alert-delivery" style="display: none">{l s="Your address is incomplete, please update it." d="Shop.Notifications.Error"}</p>
        {/if}
      {/if}

      {if !$show_invoice_address_form and !$use_same_address}
        <h3>
          <span>{l s='Your Invoice Address' d='Shop.Theme.Checkout'}</span>
          <a 
            class="button icon-plus icon-only"
            href="{$new_address_invoice_url}" 
            title="{l s='add new address' d='Shop.Theme.Actions'}"
          ></a>
        </h3>
        <div id="invoice-addresses" class="address-selector js-address-selector">
          {include  file        = 'checkout/_partials/address-selector-block.tpl'
                    addresses   = $customer.addresses
                    name        = "id_address_invoice"
                    selected    = $id_address_invoice
                    type        = "invoice"
                    interactive = !$show_delivery_address_form and !$show_invoice_address_form
          }
        </div>

        {if isset($invoice_address_error)}
          <p class="alert alert-danger js-address-error" name="alert-invoice" id="id-failure-address-{$invoice_address_error.id_address}">{$invoice_address_error.exception}</p>
        {else}
          <p class="alert alert-danger js-address-error" name="alert-invoice" style="display: none">{l s="Your address is incomplete, please update it." d="Shop.Notifications.Error"}</p>
        {/if}
      {/if}
      
      {if !$form_has_continue_button}
        <footer>
          {if $use_same_address}
            <ul class="list list-min-content">
              <li class="icon-info">{l s='The selected address will be used both as your personal address (for invoice) and as your shipping address.' d='Shop.Theme.Checkout'}</li>
            </ul>
          {/if}

          {if $use_same_address && !$cart.is_virtual}
            <a 
              class="button icon-directions"
              data-link-action="different-invoice-address" 
              href="{$use_different_address_url}"
              >{l s='Billing address differs from shipping address' d='Shop.Theme.Checkout'}
            </a>
          {/if}

          <button 
            type="submit" 
            class="icon-arrow-down-circle continue" 
            name="confirm-addresses" 
            value="1"
            >{l s='Continue' d='Shop.Theme.Actions'}
          </button>
          <input type="hidden" id="not-valid-addresses" value="{$not_valid_addresses}">
        </footer>
      {/if}
    </form>
  </div>
{/block}

{block name="step_content_summary"}
  <div class="grid">
    <article id="delivery-address" class="address">
      <header>
        <span class="h2">{l s='Your Delivery Address' d='Shop.Theme.Checkout'}</span>
      </header>
      <div>
        {$customer.addresses[$cart.id_address_delivery]['formatted'] nofilter}
      </div>
    </article>
    <article id="invoice-address" class="address">
      <header>
        <span class="h2">{l s='Your Invoice Address' d='Shop.Theme.Checkout'}</span>
      </header>
      <div>
        {$customer.addresses[$cart.id_address_invoice]['formatted'] nofilter}
      </div>
    </article>
	</div>
{/block}