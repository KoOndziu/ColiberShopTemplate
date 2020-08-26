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

{block name='address_block_item'}
  <article id="address-{$address.id}" class="address" data-id-address="{$address.id}">
    <header>
      <span class="h2">{$address.alias}</span>
      
      <nav>
        <a 
          class="button icon-pencil" 
          href="{url entity=address id=$address.id}" 
          data-link-action="edit-address"
        ></a>
        <a 
          class="button icon-trash" 
          href="{url entity=address id=$address.id params=['delete' => 1, 'token' => $token]}" 
          data-link-action="delete-address"
        ></a>
      </nav>
    </header>
    <address>{$address.formatted nofilter}</address>
  </article>
{/block}
