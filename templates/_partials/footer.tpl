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


