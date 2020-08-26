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

{if !$configuration.is_catalog && 
    $product.is_customizable && 
    count($product.customizations.fields)}
  <div class="product-customization">
    {block name='product_customization_form'}

      <form 
        class="flex"
        method="post" 
        action="{$product.url}" 
        enctype="multipart/form-data"
      >
        {foreach from=$customizations.fields item="field"}
          <div class="customization-{$field.label}">

            {if $field.type == 'text'}

              <label title="{l s='250 char. max' d='Shop.Forms.Help'}">{$field.label}</label>
              <input
                class="product-message customization-message" 
                type="text"
                name="{$field.input_name}"
                placeholder="{$field.label}" 
                value="{if $field.text !== ''}{$field.text}{/if}"
                maxlength="250"
                {if $field.required} required {/if}     
              >

            {elseif $field.type == 'image'}

              <label title="{l s='.png .jpg .gif' d='Shop.Forms.Help'}">{$field.label}</label>
              {if $field.is_customized}
                <img src="{$field.image.small.url}">
                <a 
                  class="button remove-image icon-trash" 
                  href="{$field.remove_image_url}" 
                  rel="nofollow"
                  >{l s='Remove Image' d='Shop.Theme.Actions'}
                </a>
              {else}
                <input 
                  class="custom-file file-input"
                  type="file" 
                  name="{$field.input_name}"
                  {if $field.required} required {/if}
                >
              {/if}

            {/if}

          </div>
        {/foreach}

        <div class="customization-submit last">
          <button 
            class="btn btn-primary icon-drawer" 
            type="submit" 
            name="submitCustomizedData"
            >{l s='Save Customization' d='Shop.Theme.Actions'}
          </button>
        </div>

      </form>
    {/block}
  </div>
{/if}