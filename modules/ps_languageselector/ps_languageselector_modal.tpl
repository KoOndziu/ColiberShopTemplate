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
	{assign var="modal" value=[
      'id' => 'ps-languageselector-modal',
			'class' => 'modal modal-right'
  ]}
{/block}

{block name='modal_title'}
	{{l s='Language:' d='Shop.Theme.Global'}|regex_replace:"/:/":""} 
	- 
	{{l s='Currency:' d='Shop.Theme.Global'}|regex_replace:"/:/":""}
{/block}

{block name='modal_body'}
	<span class="extender icon-bubbles">
    <span>{{l s='Language:' d='Shop.Theme.Global'}|regex_replace:"/:/":""}</span>
    <br>
    <span>{$current_language.name}</span>
  </span>
	<ul class="list">
		{foreach from=$languages item=language}
			<li {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
        <a href="{$link->getLanguageLink($language.id_lang)}" rel="nofollow">
          <input
            class="radio-color flag-icon-{$language.language_code|regex_replace:"/.*-/":""}"
            id="language-{$language.id_lang}"
            type="radio"
            name="language"
            {if $language.id_lang == $current_language.id_lang}checked{/if}
            onclick="location.href='{$link->getLanguageLink($language.id_lang)}';"
          ><label for="language-{$language.id_lang}">{$language.name}</label>
        </a>
			</li>
		{/foreach}
	</ul>
	{hook h='displayCurrencySelector'}
{/block}

{block name='modal_footer'}
{/block}