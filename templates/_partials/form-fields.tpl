{if $field.type == 'hidden'}

  {block name='form_field_item_hidden'}
    <input type="hidden" name="{$field.name}" value="{$field.value}">
  {/block} 

{elseif $field.type == 'select'}

  {block name='form_field_item_select'}
    <label class='select-field {if $field.required}required{/if}'>
      <span>{$field.label}</span>
      <select name="{$field.name}" {if $field.required}required{/if}>
        <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
        {foreach from=$field.availableValues item="label" key="value"}
          <option value="{$value}" {if $value eq $field.value}selected{/if}>{$label}</option>
        {/foreach}
      </select>
    </label>
  {/block}

{elseif $field.type == 'countrySelect'}

  {block name='form_field_item_country'}
    <label for="field-{$field.name}" class='select-field {if $field.required}required{/if}'>{$field.label}</label>
    <select id="field-{$field.name}" class="js-country" name="{$field.name}" {if $field.required}required{/if}>
      <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
      {foreach from=$field.availableValues item="label" key="value"}
        <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
      {/foreach}
    </select>
  {/block}

{elseif $field.type == 'radio-buttons'}

  {block name='form_field_item_radio'}
    <label 
      class="radio-field {if $field.required}required{/if}"
      for="field-{$field.name}"
    >{$field.label}</label>
    <span>
      {foreach from=$field.availableValues item="label" key="value"}
        <input
          id="field-{$field.name}-{$value}"
          name="{$field.name}"
          type="radio"
          value="{$value}"
          {if $field.required}required{/if}
          {if $value eq $field.value}checked{/if}
        >
        <label for="field-{$field.name}-{$value}">{$label}</label>
      {/foreach}
    </span>
  {/block}

{elseif $field.type == 'checkbox'}

  {block name='form_field_item_checkbox'}
    <span>
      <input
        id="field-{$field.name}-{$field.value}"
        name="{$field.name}"
        type="checkbox"
        value="1"
        {if $field.required}required{/if}
        {if $field.value}checked{/if}
      >
      <label 
        class="checkbox-field {if $field.required}required{/if}"
        for="field-{$field.name}-{$field.value}"
      >{$field.label nofilter}</label>
    </span>
  {/block}

{elseif $field.type == 'date'}

	{block name='form_field_item_date'}
		<input name="{$field.name}" class="form-control" type="date" value="{$field.value}" placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}">
		{if isset($field.availableValues.comment)}
			<span class="form-control-comment">
				{$field.availableValues.comment}
			</span>
		{/if}
	{/block}	
	
{elseif $field.type == 'birthday'}

	{block name='form_field_item_birthday'}
		<div class="js-parent-focus">
			{html_select_date
			field_order=DMY
			time={$field.value}
			field_array={$field.name}
			prefix=false
			reverse_years=true
			field_separator='<br>'
			day_extra='class="form-control form-control-select"'
			month_extra='class="form-control form-control-select"'
			year_extra='class="form-control form-control-select"'
			day_empty={l s='-- day --' d='Shop.Forms.Labels'}
			month_empty={l s='-- month --' d='Shop.Forms.Labels'}
			year_empty={l s='-- year --' d='Shop.Forms.Labels'}
			start_year={'Y'|date}-100 end_year={'Y'|date}
			}
		</div>
	{/block}

{elseif $field.type == 'password'}

  {block name='form_field_item_password'}
    <label for="field-{$field.name}" id="" {if $field.required}class="required"{/if}>{$field.label}</label>
    <input
      id="field-{$field.name}"
			class="js-child-focus js-visible-password"
      name="{$field.name}"
			title="{l s='At least 5 characters long' d='Shop.Forms.Help'}"
      type="password"
      value=""
			placeholder="{$field.label}"
      pattern=".{literal}{{/literal}5,{literal}}{/literal}"
      {if $field.required}required{/if}
    >
  {/block}

{else}

  {block name='form_field_item_other'}
    <label for="field-{$field.name}" {if $field.required}class="required"{/if}>
      {$field.label} 
      {if $field.required}*{/if} 
      {if $field.availableValues}<small>{$field.availableValues.comment}</small>{/if}
    </label>    
    <input 
      id="field-{$field.name}" 
      name="{$field.name}" 
      type="{$field.type}" 
      value="{$field.value}" 
      placeholder="{if $field.availableValues}{$field.availableValues.placeholder}{else}{$field.label}{/if}"
      {if $field.maxLength}maxlength="{$field.maxLength}"{/if}
			{if $field.required}required{/if}>
  {/block}

{/if}

{block name='form_field_errors'}
  {include file='_partials/form-errors.tpl' errors=$field.errors}
{/block}