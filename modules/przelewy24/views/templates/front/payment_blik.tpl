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

{if isset($actionLink)}
    <form action="{$actionLink}" method="get">
        <div style="padding-left:45px;">
            <p>
                {l s='Insert BlikCode number' mod='przelewy24'}
            </p>
            <dl>
                <dd>
                    <input id="p24-blikCode" class="form-control" type="text" name="p24_blik_code"
                           required autocomplete="off" maxlength="6" style="width:200px;">
                </dd>
            </dl>
        </div>
    </form>
{else}
    <section>
        <p>
            {l s='You have existing alias, please proceed with your order' mod='przelewy24'}.
        </p>
    </section>
{/if}