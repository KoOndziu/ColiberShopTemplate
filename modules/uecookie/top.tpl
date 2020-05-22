<script>
    {literal}
    function setcook() {
        var nazwa = 'cookie_ue';
        var wartosc = '1';
        var expire = new Date();
        expire.setMonth(expire.getMonth() + 12);
        document.cookie = nazwa + "=" + escape(wartosc) + ";path=/;" + ((expire == null) ? "" : ("; expires=" + expire.toGMTString()))
    }

    {/literal}
    {if Configuration::get('uecookie_close_anim')==1}
    {literal}
        function closeUeNotify() {
            $('#cookieNotice').fadeOut(1500);
            setcook();
        }
    {/literal}
    {/if}
    {literal}

    {/literal}
    {if Configuration::get('uecookie_close_anim')==0}
    {literal}
        function closeUeNotify() {
            {/literal}{if $vareu->uecookie_position==2}{literal}
            $('#cookieNotice').animate(
                    {bottom: '-200px'},
                    2500, function () {
                        $('#cookieNotice').hide();
                    });
            setcook();
            {/literal}{else}{literal}
            $('#cookieNotice').animate(
                    {top: '-200px'},
                    2500, function () {
                        $('#cookieNotice').hide();
                    });
            setcook();
            {/literal}{/if}{literal}
        }
    {/literal}
    {/if}
    {literal}
    {/literal}
</script>

<div 
  id="cookieNotice" 
  class="
    {if !Configuration::get('uecookie_lib')} fixed {/if}
    {if $vareu->uecookie_position==2} fixed-bottom {else} fixed-top {/if}
  "
>
  <div 
    class="
      cookieNoticeContainer 
      content
      {if Configuration::get('uecookie_x_where')==1} row
      {else if Configuration::get('uecookie_x_where')==2} row-reverse
      {else if Configuration::get('uecookie_x_where')==3} column-reverse
      {/if}
    "
  >
    <div 
      class="
        cookieCloseButton
        {if Configuration::get('uecookie_x_fa')} icon-close
        {else} button
        {/if}" 
      onclick="closeUeNotify()"
    >
      {if !Configuration::get('uecookie_usex')}
        {l s='close' mod='uecookie'}
      {else if !Configuration::get('uecookie_x_fa')}
        X
      {/if}
    </div>  
    {$uecookie nofilter}
  </div>
</div>