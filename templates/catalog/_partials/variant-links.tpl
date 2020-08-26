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

<ul class="variant-links">
  {foreach from=$variants item=variant}
		<li>
			<a href="{$variant.url}"
				 class="{$variant.type} radio-color"
				 title="{$variant.name}"
				 {*
						TODO:
							put color in a data attribute for use with attr() as soon as browsers support it,
							see https://developer.mozilla.org/en/docs/Web/CSS/attr
					*}
				{if $variant.html_color_code} style="background-color: {$variant.html_color_code}" {/if}
				{if $variant.texture} style="background-image: url({$variant.texture})" {/if}
			></a>
		</li>
	{/foreach}
	<span class="js-count count"></span>
</ul>