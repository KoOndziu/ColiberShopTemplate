{block name='step'}
  <section
    id="{$identifier}"
    class="{[
      'checkout-step'   => true,
      '-current'        => $step_is_current,
      '-reachable'      => $step_is_reachable,
      '-complete'       => $step_is_complete,
      'js-current-step' => $step_is_current
    ]|classnames} step-edit"
  >
    <header
      class="h2 js-checkout-step-header step-title step-number">
      <!--{$position}-->{$title}
      {if $step_is_complete && $step_is_reachable}<button class="icon-pencil edit-icon"></button>{/if}
    </header>
    <div id="content-{$identifier}" class="step-content">
        {block name='step_content'}DUMMY STEP CONTENT{/block}
    </div>
    {if !$step_is_current}
      <div id="content-{$identifier}-summary" class="step-content-summary">
          {block name='step_content_summary'}{/block}
      </div>
    {/if}
  </section>
{/block}