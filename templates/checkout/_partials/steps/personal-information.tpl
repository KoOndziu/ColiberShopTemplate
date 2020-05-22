{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  {hook h='displayPersonalInformationTop' customer=$customer}

  {if $customer.is_logged && !$customer.is_guest}
    <form class="form-normal" method="GET" action="{$urls.pages.order}">
      
      {include file='customer/_partials/customer-info.tpl'}
      
      <section class="list-min-content">
      {if !isset($empty_cart_on_logout) || $empty_cart_on_logout} 
        {include 
          file='_partials/notifications.tpl' 
          notifications=
          [
            "warning"=>
            [
              {l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}
            ]
          ]
        }
      {/if}
      </section>
      
      <footer>
        <a 
          class='icon-logout button' 
          href='{$urls.actions.logout}'
          >{l s='Sign out' d='Shop.Theme.Actions'}
        </a>
        <button
          class="icon-arrow-down-circle continue"
          name="controller"
          type="submit"
          value="order"
          >{l s='Continue' d='Shop.Theme.Actions'}
        </button>
      </footer>
    </form>

  {else}
    
    <ul 
      class="nav nav-tabs" 
      id="myTab" 
      role="tablist"
    >
      <li class="nav-item">
        <a 
          id="home-tab" 
          class="nav-link icon-login {if !$customer.is_guest && !$customer.is_logged}active{/if}" 
          href="#login-form"
          aria-controls="login-form" 
          aria-selected="{if !$customer.is_guest && !$customer.is_logged}true{else}false{/if}"
          data-toggle="tab"
          role="tab" 
          >{l s='Sign in' d='Shop.Theme.Actions'}
        </a>
      </li>
      <li class="nav-item">
        <a 
          id="customer-form-tab"
          class="nav-link icon-user-follow" 
          href="#customer-form" 
          aria-controls="customer-form" 
          aria-selected="false"
          data-toggle="tab" 
          role="tab" 
          >{l s='Create an account' d='Shop.Theme.Customeraccount'}
        </a>
      </li>
      {if $guest_allowed}
      <li class="nav-item">
        <a 
          id="guest-form-tab" 
          class="nav-link icon-ghost {if $customer.is_guest && $customer.is_logged}active{/if}" 
          href="#guest-form" 
          aria-controls="guest-form" 
          aria-selected="{if $customer.is_guest && $customer.is_logged}true{else}false{/if}"
          data-toggle="tab"
          role="tab" 
          >{l s='Order as a guest' d='Shop.Theme.Checkout'}
        </a>
      </li>
      {/if}
    </ul>
    <div class="tab-content" id="myTabContent">
      <div 
        id="login-form" 
        class="tab-pane fade show {if !$customer.is_guest && !$customer.is_logged}active{/if}" 
        role="tabpanel" 
        aria-labelledby="login-form-tab">
        {render file='checkout/_partials/login-form.tpl' ui=$login_form}
      </div>
      <div 
        id="customer-form" 
        class="tab-pane fade" 
        role="tabpanel" 
        aria-labelledby="customer-form-tab">
        {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
      </div>
      {if $guest_allowed}
      <div 
        id="guest-form" 
        class="tab-pane fade {if $customer.is_guest && $customer.is_logged}active{/if}" 
        role="tabpanel" 
        aria-labelledby="guest-form-tab">
        {render file='checkout/_partials/guest-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
      </div>
      {/if}
    </div>

  {/if}
{/block}

{block name='step_content_summary'}
  {include file='customer/_partials/customer-info.tpl'}
{/block}