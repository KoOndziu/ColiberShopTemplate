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

<form>
  <div 
    class="js-mailalert flex" 
    data-url="{url 
                entity='module' 
                name='ps_emailalerts' 
                controller='actions' 
                params=['process' => 'add']}"
  >
    {if isset($id_module)}
      <div class="terms">
        {hook h='displayGDPRConsent' id_module=$id_module}
      </div>
    {/if}
    
    {if isset($email) AND $email}
      <div>
        <input 
          class="form-control" 
          type="email" 
          placeholder="{l s='your@email.com' d='Modules.Mailalerts.Shop'}"
        >
      </div>
    {/if}
    
    <div class="last">
      <input type="hidden" value="{$id_product}"/>
      <input type="hidden" value="{$id_product_attribute}"/>
      <button 
        class="icon-speech"
        type="submit" 
        rel="nofollow" 
        onclick="return addNotification();"
        >{l s='Notify me when available' d='Modules.Mailalerts.Shop'}
      </button>
      <span style="display:none;"></span>
    </div>
  </div>
</form>