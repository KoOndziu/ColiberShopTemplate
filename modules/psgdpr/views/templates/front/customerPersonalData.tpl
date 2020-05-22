{extends file='customer/page.tpl'}

{block name='head_seo_title'}
	{l s='GDPR - Personal data' mod='psgdpr'}
{/block}

{block name='page_title'}
	{l s='GDPR - Personal data' mod='psgdpr'}
{/block}

{block name='page_content'}
	<section class="set">
		<h2>{l s='Access to my data' mod='psgdpr'}</h2>
		<p>{l s='At any time, you have the right to retrieve the data you have provided to our site. Click on "Get my data" to automatically download a copy of your personal data on a pdf or csv file.' mod='psgdpr'}</p>
		<div>
			<a 
				id="exportDataToCsv" 
				class="icon-doc button submit" 
				target="_blank" 
				href="{$psgdpr_csv_controller|escape:'htmlall':'UTF-8'}"
				>{l s='GET MY DATA TO CSV' d='Psgdpr.Customerpersonaldata' mod='psgdpr'}
			</a><a 
				id="exportDataToPdf" 
				class="icon-doc button submit" 
				target="_blank" 
				href="{$psgdpr_pdf_controller|escape:'htmlall':'UTF-8'}"
				>{l s='GET MY DATA TO PDF' mod='psgdpr'}
			</a>
		</div>
	</section>
	<section class="set">
		<h2>{l s='Rectification & Erasure requests' mod='psgdpr'}</h2>
		<p>{l s='You have the right to modify all the personal information found in the "My Account" page. For any other request you might have regarding the rectification and/or erasure of your personal data, please contact us through our' mod='psgdpr'} <a href="{$psgdpr_contactUrl|escape:'htmlall':'UTF-8'}">{l s='contact page' mod='psgdpr'}</a>. {l s='We will review your request and reply as soon as possible.' mod='psgdpr'}</p>
	</section>
{literal}
<script type="text/javascript">
    var psgdpr_front_controller = "{/literal}{$psgdpr_front_controller|escape:'htmlall':'UTF-8'}{literal}";
    var psgdpr_id_customer = "{/literal}{$psgdpr_front_controller|escape:'htmlall':'UTF-8'}{literal}";
    var psgdpr_ps_version = "{/literal}{$psgdpr_ps_version|escape:'htmlall':'UTF-8'}{literal}";
</script>
{/literal}
{/block}
