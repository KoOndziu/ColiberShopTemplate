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

<div class="contact-rich">
  <h2>{l s='Store information' d='Shop.Theme.Global'}</h2>
  <address class="data">
    {$contact_infos.address.formatted nofilter}
  </address>
  
  {if $contact_infos.phone}
    <div class="icon-phone">{l s='Call us:' d='Shop.Theme.Global'} 
      <a href="tel:{$contact_infos.phone}">{$contact_infos.phone}</a>
    </div>
  {/if}
  {if $contact_infos.email}
    <div class="icon-envelope">{l s='Email us:' d='Shop.Theme.Global'} 
      <a href="mailto:{$contact_infos.email}">{$contact_infos.email}</a>
    </div>
  {/if}
  {if $contact_infos.fax}
    <div class="icon-printer">{l s='Fax:' d='Shop.Theme.Global'} {$contact_infos.fax}</div>
  {/if}
</div>
