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
