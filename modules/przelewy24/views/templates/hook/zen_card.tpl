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

{* ZENCARD *}

{if $mode_zencard}
    <div id="p24-zen-loader" class="loader-bg">
        <div class="loader center"></div>
    </div>
    <div style="clear:both;" id="zenCards"></div>
    <div id="zenDiscountWrapper">
        <div style="clear:both;" id="zenDiscount"></div>
        <div id="zen-discount-is-loading">
            Wczytywanie kuponu do koszyka...
        </div>
    </div>
    <div style="display: none" id="p24_zencard_products_with_tax">
        {$p24_zencard_products_with_tax}
    </div>
    <div style="clear:both;" id="zenTotal"></div>
    <hr/>
{/if}

{* /ZENCARD *}
