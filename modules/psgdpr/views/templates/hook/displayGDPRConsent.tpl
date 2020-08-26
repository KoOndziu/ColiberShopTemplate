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

<div id="gdpr_consent" class="gdpr_module_{$psgdpr_id_module|escape:'htmlall':'UTF-8'}">
    <div class="form-check psgdpr_consent_message">
      <input id="psgdpr_consent_checkbox_{$psgdpr_id_module|escape:'htmlall':'UTF-8'}" name="psgdpr_consent_checkbox" type="checkbox" value="1">
      <label for="psgdpr_consent_checkbox_{$psgdpr_id_module|escape:'htmlall':'UTF-8'}">{$psgdpr_consent_message nofilter}</label>
    </div>
</div>
{literal}
<script type="text/javascript">
    var psgdpr_front_controller = "{/literal}{$psgdpr_front_controller|escape:'htmlall':'UTF-8'}{literal}";
    psgdpr_front_controller = psgdpr_front_controller.replace(/\amp;/g,'');
    var psgdpr_id_customer = "{/literal}{$psgdpr_id_customer|escape:'htmlall':'UTF-8'}{literal}";
    var psgdpr_customer_token = "{/literal}{$psgdpr_customer_token|escape:'htmlall':'UTF-8'}{literal}";
    var psgdpr_id_guest = "{/literal}{$psgdpr_id_guest|escape:'htmlall':'UTF-8'}{literal}";
    var psgdpr_guest_token = "{/literal}{$psgdpr_guest_token|escape:'htmlall':'UTF-8'}{literal}";

    document.addEventListener('DOMContentLoaded', function() {
        let psgdpr_id_module = "{/literal}{$psgdpr_id_module|escape:'htmlall':'UTF-8'}{literal}";
        let parentForm = $('.gdpr_module_' + psgdpr_id_module).closest('form');

        let toggleFormActive = function() {
            let parentForm = $('.gdpr_module_' + psgdpr_id_module).closest('form');
            let checkbox = $('#psgdpr_consent_checkbox_' + psgdpr_id_module);
            let element = $('.gdpr_module_' + psgdpr_id_module);
            let iLoopLimit = 0;

            // Look for parent elements until we find a submit button, or reach a limit
            while(0 === element.nextAll('[type="submit"]').length &&  // Is there any submit type ?
                element.get(0) !== parentForm.get(0) &&  // the limit is the form
                element.length &&
                iLoopLimit != 1000) { // element must exit
                    element = element.parent();
                    iLoopLimit++;
            }

            if (checkbox.prop('checked') === true) {
                if (element.find('[type="submit"]').length > 0) {
                    element.find('[type="submit"]').removeAttr('disabled');
                } else {
                    element.nextAll('[type="submit"]').removeAttr('disabled');
                }
            } else {
                if (element.find('[type="submit"]').length > 0) {
                    element.find('[type="submit"]').attr('disabled', 'disabled');
                } else {
                    element.nextAll('[type="submit"]').attr('disabled', 'disabled');
                }
            }
        }

        // Triggered on page loading
        toggleFormActive();

        // Listener ion the checkbox click
        $(document).on('click' , '#psgdpr_consent_checkbox_'+psgdpr_id_module, function() {
            toggleFormActive();
        });

        $(document).on('submit', parentForm, function(event) {
            $.ajax({
                data: 'POST',
                url: psgdpr_front_controller,
                data: {
                    ajax: true,
                    action: 'AddLog',
                    id_customer: psgdpr_id_customer,
                    customer_token: psgdpr_customer_token,
                    id_guest: psgdpr_id_guest,
                    guest_token: psgdpr_guest_token,
                    id_module: psgdpr_id_module,
                },
                error: function (err) {
                    console.log(err);
                }
            });
        });
    });
</script>
{/literal}
