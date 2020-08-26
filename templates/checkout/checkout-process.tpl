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

<div class="accordion content" id="checkout-process">
  {foreach from=$steps item="step" key="index"}
    {render identifier  =  $step.identifier
            position    =  ($index + 1)
            ui          =  $step.ui
    }
  {/foreach}
</div>
