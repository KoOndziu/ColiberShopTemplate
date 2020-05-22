{block name='social_sharing'}
  {if $social_share_links}
    <div class="social-sharing">
      <ul>
        {foreach from=$social_share_links item='social_share_link'}
          <li>
						<a 
							class="{$social_share_link.class} icon-social-{$social_share_link.class}" 
							href="{$social_share_link.url}" 
							target="_blank"
							title="{$social_share_link.label}"
						></a>
					</li>
        {/foreach}
      </ul>
    </div>
  {/if}
{/block}
