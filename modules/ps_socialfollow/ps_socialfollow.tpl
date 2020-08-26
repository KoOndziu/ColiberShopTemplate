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

{block name='ps_social_follow'}
  {if $social_links}
    <section class="ps-social-follow">
      <span>{l s='Follow us' d='Modules.Socialfollow.Shop'}: </span>
      <ul>
        {foreach from=$social_links item='social_link'}
          <li class="{$social_link.class}">
            <a 
              class="button icon-social-{$social_link.label|lower}"
              href="{$social_link.url}"
              title="{$social_link.label}"
            ></a>
          </li>
        {/foreach}
      </ul>
    </section>
  {/if}
{/block}
