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

{if $product.attachments}
  <div class="product-attachments grid">
    {foreach from=$product.attachments item=attachment}
      <a 
        class="attachment" 
        href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}"
      >
        <header>
          <span class="h2">{$attachment.name}</span>
          <nav>
            <button class="icon-cloud-download"></button>
          </nav>
        </header>
        <p>
          {$attachment.description}<br>
          {$attachment.file_size_formatted}
        </p>
      </a>
    {/foreach}
  </div>
{/if}