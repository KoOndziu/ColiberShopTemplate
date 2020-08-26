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

{$icon = [
  'error' => 'icon-close',
  'warning' => 'icon-exclamation',
  'success'=>'icon-check',
  'info'=>'icon-info'
]}

{block name='notify'}
  <li	
    role="alert" 
    data-alert="{if $notify.type===error}danger{else}{$notify.type}{/if}" 
    class="notification-{$notify.type}"
   >
    <div>
      <i class="{$icon[$notify.type]}"></i>
      <div>{$notify.text nofilter}</div>
      {if isset($notify.closable) && $notify.closable}<button class="icon-close"></button>{/if}
    </div>
  </li>
{/block}