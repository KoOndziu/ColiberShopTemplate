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
