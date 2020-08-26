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

{block name='step'}
  <section
    id="{$identifier}"
    class="{[
      'checkout-step'   => true,
      '-current'        => $step_is_current,
      '-reachable'      => $step_is_reachable,
      '-complete'       => $step_is_complete,
      'js-current-step' => $step_is_current
    ]|classnames} step-edit card"
  >
    <header
      class="h2 js-checkout-step-header step-title step-number card-header">
      <!--{$position}-->{$title}
      {if $step_is_complete && $step_is_reachable}<button class="icon-pencil edit-icon"></button>{/if}
    </header>
    <div id="content-{$identifier}" class="step-content card-body">
        {block name='step_content'}DUMMY STEP CONTENT{/block}
    </div>
    {if !$step_is_current}
      <div id="content-{$identifier}-summary" class="step-content-summary card-body">
          {block name='step_content_summary'}{/block}
      </div>
    {/if}
  </section>
{/block}