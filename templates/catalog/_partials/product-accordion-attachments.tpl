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