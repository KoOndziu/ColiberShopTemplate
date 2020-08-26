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