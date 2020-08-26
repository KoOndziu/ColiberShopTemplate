{if isset($notifications) or 
    isset($errors) or 
    isset($warnings) or 
    isset($successes) or 
    isset($infos)
}
	<ul class="notifications">

    {if isset($notifications.error)}
      {foreach $notifications.error item=$notify}
        {include file='_partials/notify.tpl' notify=['type'=>'error','text'=>$notify,'closable'=>1]}
      {/foreach}
    {/if}
    {if isset($notifications.warning)}
      {foreach $notifications.warning item=$notify}
        {include file='_partials/notify.tpl' notify=['type'=>'warning','text'=>$notify,'closable'=>1]}
      {/foreach}
    {/if}
    {if isset($notifications.success)}
      {foreach $notifications.success item=$notify}
        {include file='_partials/notify.tpl' notify=['type'=>'success','text'=>$notify,'closable'=>1]}
      {/foreach}
    {/if}
    {if isset($notifications.info)}
      {foreach $notifications.info item=$notify}
        {include file='_partials/notify.tpl' notify=['type'=>'info','text'=>$notify,'closable'=>1]}
      {/foreach}
    {/if}
    
    {if isset($errors)}
      {foreach $errors item=$notify}
        {include file='_partials/notify.tpl' notify=['type'=>'error','text'=>$notify,'closable'=>1]}
      {/foreach}
    {/if}
    {if isset($warnings)}
      {foreach $warnings item=$notify}
        {include file='_partials/notify.tpl' notify=['type'=>'warning','text'=>$notify,'closable'=>1]}
      {/foreach}
    {/if}
    {if isset($successes)}
      {foreach $successes item=$notify}
        {include file='_partials/notify.tpl' notify=['type'=>'success','text'=>$notify,'closable'=>1]}
      {/foreach}
    {/if}
    {if isset($infos)}
      {foreach $info item=$notify}
        {include file='_partials/notify.tpl' notify=['type'=>'info','text'=>$notify,'closable'=>1]}
      {/foreach}
    {/if}
    
	</ul>
{/if}