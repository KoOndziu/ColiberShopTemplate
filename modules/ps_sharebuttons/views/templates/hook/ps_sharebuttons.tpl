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
