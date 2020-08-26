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

{block name='cart_detailed_totals'}
	<section class="cart-detailed-totals">
    {if !empty($cart.products)}
      {include file='checkout/_partials/totals.tpl' 
        subtotals=$cart.subtotals 
        totals=$cart.totals
      }
    {else}
      <div class="js-cart">
        <p 
          class="cart-is-empty icon-ghost extender"
          >{l s='There are no more items in your cart' d='Shop.Theme.Checkout'}.
        </p>
      </div>
    {/if}
	</section>
{/block}