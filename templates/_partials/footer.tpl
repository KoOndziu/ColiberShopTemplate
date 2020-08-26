{**
 * 2007-2017 PrestaShop
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
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='hook_footer_before'}
  {hook h='displayFooterBefore'}
{/block}

<div class="content footer-grid">
  {block name='hook_footer'}
    {hook h='displayFooter'}
  {/block}	
</div>

<div class="content footer-line">  
  {block name='hook_footer_after'}
    {hook h='displayFooterAfter'}
  {/block}
  
  {block name='copyright_link'}
    <div class="copyright-link">
      <p>
        {l s='KoliberShop © %year%<br>by' sprintf=['%year%' => 'Y'|date] d='Shop.Theme.Global'} 
        <a class="_blank" href="https://facebook.com/KoOndziu97" target="_blank">Ko_Ondziu</a>
      </p>
    </div>
  {/block}
  
  {block name='hook_footer_line'}
    <div class="footer-line-hook">
      {hook h='displayFooterLine'}
    </div>
  {/block}
</div>


