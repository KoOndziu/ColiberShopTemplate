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

{if $elements}
  <div id="block-reassurance">
    <ul>
      {foreach from=$elements item=element}
        <li><img src="{$element.image|regex_replace:"/.[^.]+$/":""}"}" alt="{$element.text|escape:'quotes'}" /> <span>{$element.text}</span></li>
      {/foreach}
    </ul>
  </div>
{/if}
