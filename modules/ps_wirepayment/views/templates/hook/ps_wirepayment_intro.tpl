<section>
  <p>
    {if $bankwireCustomText }
        <a data-toggle="modal" data-target="#bankwire-modal">{l s='More information' d='Modules.Wirepayment.Shop'}</a>
    {/if}
  </p>
	<p>
		{l s='Payment is made by transfer of the invoice amount to the following account:' d='Modules.Wirepayment.Shop'}
	</p>
	{include file='module:ps_wirepayment/views/templates/hook/_partials/payment_infos.tpl'}
	{$bankwireCustomText nofilter}
</section>
