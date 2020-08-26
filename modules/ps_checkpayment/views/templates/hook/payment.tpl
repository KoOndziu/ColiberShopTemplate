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

<p class="payment_module">
	<a href="{$link->getModuleLink('ps_checkpayment', 'payment', [], true)|escape:'html'}">
		<img src="{$this_path_ps_checkpayment}logo.png" alt="{l s='Pay by check' d='Modules.Checkpayment.Shop'}" />
		{l s='Pay by check' d='Modules.Checkpayment.Shop'} {l s='(order processing will be longer)' d='Modules.Checkpayment.Shop'}
	</a>
</p>
