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

<select id="select-sort-order" name="select-city">
  {if !isset($listing.sort_selected)}
    <option value="" disabled selected>{l s='Sort' d='Shop.Theme.Actions'}</option>
  {/if}

  {foreach from=$sort_orders item=sort_order}
    <option
      class="{['current' => $sort_order.current, 'js-search-link' => true]|classnames}"
      value="{$sort_order.url}"
    >{$sort_order.label}</option>
  {/foreach}
</select>
