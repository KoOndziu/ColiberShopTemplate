{block name='social_sharing'}
  {if $social_share_links}
    <section class="social-sharing">
      <div>
        <label>{l s="Share" d="Modules.Sharebuttons.Shop"}</label>
        <ul>
          {foreach from=$social_share_links item='social_share_link'}
            <li>
              <a 
                class="button {$social_share_link.class} icon-social-{$social_share_link.class}" 
                href="{$social_share_link.url}" 
                target="_blank"
                title="{$social_share_link.label}"
              ></a>
            </li>
          {/foreach}
        </ul>
      </div>
    </section>
  {/if}
{/block}
