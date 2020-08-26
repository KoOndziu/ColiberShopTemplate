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

<div class="language-selector">
	<a 
    class="button icon-globe js-open-modal"
		rel="nofollow" 
		href="#langbox"
		title="{{l s='Currency:' d='Shop.Theme.Global'}|regex_replace:"/:/":""} - {{l s='Language:' d='Shop.Theme.Global'}|regex_replace:"/:/":""}"
	></a>
	{include file='module:ps_languageselector/ps_languageselector_modal.tpl'}
</div>
