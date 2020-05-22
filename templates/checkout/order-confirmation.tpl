{extends file='page.tpl'}

{block name='page_title'}
  {l s='Order confirmation' d='Shop.Theme.Checkout'}
{/block}

{block name='page_content_container' prepend}

  <section id="content-hook_order_confirmation" class="content">
    {block name='order_confirmation_header'}
      <h2>{l s='Your order is confirmed' d='Shop.Theme.Checkout'}</h2>
      <p>
        {l s='An email has been sent to your mail address %email%.' sprintf=['%email%' => $customer.email] d='Shop.Theme.Checkout'}<br>
        {if $order.details.invoice_url}
          {* [1][/1] is for a HTML tag. *}
          {l
            s='You can also [1]download your invoice[/1]'
            sprintf=[
              '[1]' => "<a href='{$order.details.invoice_url}'>",
              '[/1]' => "</a>"
            ]
            d='Shop.Theme.Checkout'
          }
        {/if}
      </p>
    {/block}

    {block name='hook_order_confirmation'}
      {$HOOK_ORDER_CONFIRMATION nofilter}
    {/block}
		
		{block name='hook_payment_return'}
			{if ! empty($HOOK_PAYMENT_RETURN)}
				<div id="content-hook_payment_return">
					{$HOOK_PAYMENT_RETURN nofilter}
				</div>
			{/if}
		{/block}
		
  </section>
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-order-confirmation content">

		{block name='order_detail'}
			{include file='customer/_partials/order-info.tpl'}
		{/block}
		
		{if $customer.is_guest}
			{block name='guest_to_customer'}
				{include 
					file='customer/_partials/guest-to-customer.tpl' 
					guest_email=$customer.email
				}
			{/block}
		{/if}

    {block name='hook_order_confirmation_1'}
      {hook h='displayOrderConfirmation1'}
    {/block}
  </section>
{/block}

{block name='page_content_container' append}
  <section id="content-hook-order-confirmation-footer" class="content">
    {hook h='displayOrderConfirmation2'}
  </section>
{/block}
