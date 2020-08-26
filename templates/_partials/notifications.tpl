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