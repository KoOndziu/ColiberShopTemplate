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

{extends file=$layout}

{block name='title'}
  {l s='Checkout' d='Shop.Theme.Actions'}
{/block}

{block name='content'}        
  {block name='checkout-process'}
    {render file='checkout/checkout-process.tpl' ui=$checkout_process}
  {/block}
{/block}
