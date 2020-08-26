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
	{assign var="modal" value=['id' => 'header-modal', 'class' => 'modal-left']}
{/block}

{block name='modal_title'}
	menu
{/block}

{block name='modal_body'}
	<nav class="menu">
		{hook h='displayTop'}
	</nav>
{/block}

{block name='modal_footer'}
{/block}