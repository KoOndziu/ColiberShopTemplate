{block name='pagination_summary'}
  <section class="products-pagination">
    <span class="icon-docs"></span>
    <span>{l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=[
    '%from%' => $listing.pagination.items_shown_from ,
    '%to%' => $listing.pagination.items_shown_to,
    '%total%' => $listing.pagination.total_items
    ]}</span>
  </section>
{/block}