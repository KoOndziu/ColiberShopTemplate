{if isset($notifications) and (
	(isset($notifications.error) and $notifications.error) or 
	(isset($notifications.warning) and $notifications.warning) or 
	(isset($notifications.success) and $notifications.success) or 
	(isset($notifications.info) and $notifications.info))
}
	<ul class="notifications">

		{if isset($notifications.error) and $notifications.error}
			{block name='notifications_error'}
				{foreach $notifications.error key=$class item=$notif}
					<li	role="alert" data-alert="danger" class="notification-danger {$class}">
            <div>
              <i class="icon-close"></i>
              <div>{$notif nofilter}</div>
              {if isset($closable) && $closable}<button class="icon-close"></button>{/if}
            </div>
          </li>
				{/foreach}
			{/block}
		{/if}
		
		{if isset($notifications.warning) and $notifications.warning}
			{block name='notifications_warning'}
				{foreach $notifications.warning key=$class item=$notif}
					<li role="alert" data-alert="warning" class="notification-warning {$class}">
            <div>
              <i class="icon-exclamation"></i>
              <div>{$notif nofilter}</div>
              {if isset($closable) && $closable}<button class="icon-close"></button>{/if}
            </div>
					</li>
				{/foreach}
			{/block}
		{/if}
		
		{if isset($notifications.success) and $notifications.success}
			{block name='notifications_success'}
				{foreach $notifications.success key=$class item=$notif}
					<li role="alert" data-alert="success"	class="notification-success {$class}">
            <div>
              <i class="icon-check"></i>
              <div>{$notif nofilter}</div>
              {if isset($closable) && $closable}<button class="icon-close"></button>{/if}
            </div>
					</li>
				{/foreach}
			{/block}
		{/if}
		
		{if isset($notifications.info) and $notifications.info}
			{block name='notifications_info'}
				{foreach $notifications.info key=$class item=$notif}
					<li role="alert" data-alert="info" class="notification-info {$class}">
            <div>
              <i class="icon-info"></i>
              <div>{$notif nofilter}</div>
              {if isset($closable) && $closable}<button class="icon-close"></button>{/if}
            </div>
					</li>
				{/foreach}
			{/block}
		{/if}
	
	</ul>
{/if}