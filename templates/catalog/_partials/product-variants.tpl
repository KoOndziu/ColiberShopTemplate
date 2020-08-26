<section class="product-variants">
  {foreach from=$groups key=id_attribute_group item=group}
		
		<div class="{$group.name}">
			<label for="group_{$id_attribute_group}">{$group.name}</label>

			{if $group.group_type == 'select'}

				{block name='product_variants_select'}
					<select
						data-product-attribute="{$id_attribute_group}"
						name="group[{$id_attribute_group}]"
						id="group_{$id_attribute_group}"
						>
						{foreach from=$group.attributes key=id_attribute item=group_attribute}
							<option
								value="{$id_attribute}"
								title="{$group_attribute.name}"
								{if $group_attribute.selected} selected="selected"{/if}
								>{$group_attribute.name}
							</option>
						{/foreach}
					</select>
				{/block}

			{else if $group.group_type == 'color'}

				{block name='product_variants_color'}
					<ul id="group_{$id_attribute_group}" class="input-group">
						{foreach from=$group.attributes key=id_attribute item=group_attribute}
							<li>
								<input
									id="attrid-{$id_attribute}"
									class="radio-color"
									type="radio"
									data-product-attribute="{$id_attribute_group}"
									name="group[{$id_attribute_group}]"
									value="{$id_attribute}"
									{if $group_attribute.selected} checked="checked"{/if}
									{if $group_attribute.html_color_code} style="background-color: {$group_attribute.html_color_code}" {/if}
									{if $group_attribute.texture} style="background-image: url({$group_attribute.texture})" {/if}
									title="{$group_attribute.name}"
									>
							</li>
						{/foreach}
					</ul>
				{/block}

			{else if $group.group_type == 'radio'}

				{block name='product_variants_radio'}
					<ul id="group_{$id_attribute_group}" class="input-group">
						{foreach from=$group.attributes key=id_attribute item=group_attribute}
							<li>
								<input
									id="{$id_attribute_group}-{$id_attribute}"
									class="radio-button"
									type="radio"
									data-product-attribute="{$id_attribute_group}"
									name="group[{$id_attribute_group}]"
									value="{$id_attribute}"
									{if $group_attribute.selected} checked="checked"{/if}
									>
								<label class="radio-button" for="{$id_attribute_group}-{$id_attribute}">{$group_attribute.name}</label>
							</li>
						{/foreach}
					</ul>
				{/block}

			{/if}

		</div>
  {/foreach}
</section>
