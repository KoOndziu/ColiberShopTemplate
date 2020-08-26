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