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

{block name='form_errors'}
  {if $errors|count}
    <ul class='form-errors'>
      {foreach $errors as $error}
        <li><small>{$error|regex_replace:"/^-\s/":""|ucfirst}</small></li>
      {/foreach}
    </ul>
  {/if}
{/block}
