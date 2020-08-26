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

{extends file='page.tpl'}

{block name='aside'}{hook h='displayHomeAside'}{/block}

{block name='page_header_container'}{/block}
{block name='breadcrumb'}{/block}

{block name='page_content_container'}
  {block name='hook_home'}
    {$HOOK_HOME nofilter}
  {/block}
{/block}
