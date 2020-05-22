<div class="gmparcellocker-button col-sm-12">
    {*<span id="parcel-search-address">{$gmSearchAddress}</span>*}
   <p
		 class="icon-location-pin extender"
		 >{l s='Chosen Parcel Locker:' mod='gmparcellocker'}<br><span class="chosen-parcel">{$gmChosenParcel|replace:',':'\n'}</span>
	 </p>
   <button class="icon-location-pin" id="parcel-choose" onclick="gmParcelLockerChoose();return false;">
      {l s='Choose Parcel Locker' mod='gmparcellocker'}
   </button>
</div>