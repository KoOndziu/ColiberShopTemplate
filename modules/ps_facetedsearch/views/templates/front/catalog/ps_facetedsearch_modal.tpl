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

{extends file='_partials/modal.tpl'}

{block name='modal_attr'}
	{assign var="modal" value=['id' => 'ps-facetedsearch-modal', 'class' => 'modal-top']}
{/block}

{block name='modal_title'}
	{l s='Filter' d='Shop.Theme.Actions'}
{/block}

{block name='modal_body'}
  {block name='product_active_filters'}
    {$listing.rendered_active_filters nofilter}
  {/block}
  {block name='product_filters'}
    <div class="product-filters js-product-filters">
      {$listing.rendered_facets nofilter}
    </div>
  {/block}
{/block}

{block name='modal_footer'}
{/block}