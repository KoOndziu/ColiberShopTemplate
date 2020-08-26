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

{extends file='layouts/layout-full.tpl'}

{block name='header'}{/block}

{block name='main'}
  <div id="content-wrapper" class="{block name='contentWrapperClass'}content-only{/block}">
    {hook h="displayContentWrapperTop"}
    {block name='content'}{/block}
    {hook h="displayContentWrapperBottom"}
  </div>
{/block}

{block name='footer'}{/block}
{block name='javascript_bottom'}{/block}
{block name='hook_before_body_closing_tag'}{/block}
