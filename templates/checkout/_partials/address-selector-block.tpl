{block name='address_selector_blocks'}
  <div class="grid address-selector js-address-selector">
    {foreach $addresses as $address}
      <label 
        for="{$name|classname}-address-{$address.id}-input"
        class="address address-item"
        id="{$name|classname}-address-{$address.id}"
      >
        <header>
          <span class="h2">
            {$address.alias}
          </span>
          {if $interactive}
            <nav>
              <a
                class="button icon-pencil"
                data-link-action="edit-address"
                href="{url entity='order' params=['id_address' => $address.id, 'editAddress' => $type, 'token' => $token]}"
                title="{l s='Edit' d='Shop.Theme.Actions'}"
              ></a>
              <a
                class="button icon-trash"
                data-link-action="delete-address"
                href="{url entity='order' params=['id_address' => $address.id, 'deleteAddress' => true, 'token' => $token]}"
                title="{l s='Delete' d='Shop.Theme.Actions'}"
              ></a>
              <input 
                type="radio" 
                id="{$name|classname}-address-{$address.id}-input"
                name="{$name}" 
                value="{$address.id}" 
                {if $address.id == $selected}checked{/if}
              >
            </nav>
          {/if}
        </header>
        <address>{$address.formatted nofilter}</address>
      </label>
    {/foreach}
  </div>
  {if $interactive}
    <p>
      <button class="ps-hidden-by-js" type="submit">{l s='Save' d='Shop.Theme.Actions'}</button>
    </p>
  {/if}
{/block}
