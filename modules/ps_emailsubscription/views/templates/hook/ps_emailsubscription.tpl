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

<div class="email_subscription">
  <h2>{l s='Newsletter' d='Modules.Emailsubscription.Shop'}</h2>
  {if $msg}
    <p class="notification {if $nw_error}notification-error{else}notification-success{/if}">{$msg}</p>
  {/if}
  <form class="form-normal" action="{$urls.pages.index}" method="post">
    {if $conditions}
      <p>{$conditions}</p>
    {/if}
    <input type="hidden" name="action" value="0" />
    <div class="input-group">
      <input type="text" name="email" value="{$value}" placeholder="{l s='Your e-mail' d='Modules.Emailsubscription.Shop'}" />
      <button class="icon-like" type="submit" name="submitNewsletter">OK</button>
    </div>
    {hook h='displayGDPRConsent' id_module=$id_module}
  </form>
</div>
