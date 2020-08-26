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

<div id="block-reassurance">
	<ul>
		{foreach from=$blocks item=$block key=$key}
			<li
				class="item-product"
				{if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} 
					style="cursor:pointer;" 
					onclick="window.open('{$block['link']}')"
				{/if}
			>
				
				{if $block['icon'] != 'undefined'}
					{if $block['icon']}
					<img class="svg invisible" src="{$block['icon']}">
					{elseif $block['custom_icon']}
					<img src="{$block['custom_icon']}">
					{/if}
				{/if}
				
				{if empty($block['description'])}
					<span class="block-title">{$block['title']}</span>
				{else}
					<span class="block-title">{$block['title']}</span>
					<span>{$block['description'] nofilter}</span>
				{/if}
				
			</li>
		{/foreach}
	</ul>
</div>

    
