{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
		
	{include file='customer/_partials/customer-info.tpl'}
	<p>{l s='Welcome to your account. Here you can manage all of your personal information and orders.' d='Shop.Theme.Customeraccount'}</p>
	{include file='customer/_partials/my-account-nav.tpl' list_type='grid'}

{/block}
