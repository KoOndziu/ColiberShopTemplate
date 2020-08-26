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

{extends file='page.tpl'}

{block name='page_title'}
  {l s='Our stores' d='Shop.Theme.Global'}
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content content page-stores">

    {foreach $stores as $store}
      <article id="store-{$store.id}" class="store-item">
        <header>
          <h2>{$store.name}</h2>
        </header>

        <div>
          <div class="store-picture">
            <img src="{$store.image.bySize.stores_default.url}" alt="{$store.image.legend}">
          </div>
          <ul>
            <li>{$store.address.formatted nofilter}</li>
            {if $store.phone}
              <li>{l s='Phone:' d='Shop.Theme.Global'} {$store.phone}</li>
            {/if}
            {if $store.fax}
              <li>{l s='Fax:' d='Shop.Theme.Global'} {$store.fax}</li>
            {/if}
            {if $store.email}
              <li>{l s='Email:' d='Shop.Theme.Global'} {$store.email}</li>
            {/if}
          </ul>
          
          <h3>{l s='Opening hours' d='Shop.Theme.Global'}</h3>
          <dl>
            {foreach $store.business_hours as $day}
                <dt>{$day.day}</dt>
              {foreach $day.hours as $h}
                <dd>{$h}</dd>
              {/foreach}
            {/foreach}
          </dl>
        </div>

      </article>
    {/foreach}

  </section>
{/block}
