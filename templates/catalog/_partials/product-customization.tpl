{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class="product-customization">
  {if !$configuration.is_catalog}
    {block name='product_customization_form'}
      
      <form 
				class="grid"
				method="post" 
				action="{$product.url}" 
				enctype="multipart/form-data"
			>
        {foreach from=$customizations.fields item="field"}
					<section class="customization-{$field.label}">

						{if $field.type == 'text'}

							<label>{$field.label}<br><small>{l s='250 char. max' d='Shop.Forms.Help'}</small></label>
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

							<label>{$field.label}<br><small>{l s='.png .jpg .gif' d='Shop.Forms.Help'}</small></label>
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
						
					</section>
        {/foreach}
				
				<section class="customization-submit">
					<button 
						class="btn btn-primary icon-drawer" 
						type="submit" 
						name="submitCustomizedData"
						>{l s='Save Customization' d='Shop.Theme.Actions'}
					</button>
				</section>
        
      </form>
    {/block}
  {/if}
</div>
