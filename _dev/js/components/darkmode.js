/** 
 * 2019-2020 Konrad Kubala <000konrad000@gmail.com>
 * 
 * NOTICE OF LICENSE
 * 
 * This source file is subject to the AFL-3.0
 * that is bundled with this package in the file LICENSE.txt.
 * 
 * @author    Konrad Kubala <000konrad000@gmail.com>
 * @copyright 2007-26 sie 2020 Konrad Kubala <000konrad000@gmail.com>
 * @license   AFL-3.0
 */

import $ from 'jquery';
import prestashop from 'prestashop';

function toggleDarkMode() {
	$(':root').removeClass(isDarkMode() ? 'dark-mode' : 'light-mode');
	$(':root').addClass(isDarkMode() ? 'light-mode' : 'dark-mode');
	document.cookie = 'dm=' + !isDarkMode() + '; path=/';
}

function isDarkMode() {
  return document.cookie.match(/dm=true/i) !== null;
}

function setThemeFromCookie() {
  $(':root').addClass(isDarkMode() ? 'dark-mode' : 'light-mode');
}

(function() {
  setThemeFromCookie();
})();

$(document).ready(() => {
	$(document).on('click', '.toggle-dark-mode', function() {
		toggleDarkMode();
	});
	
	$(document).keydown(function(e) {
		if (e.keyCode === 68 && e.ctrlKey && e.shiftKey) toggleDarkMode();
	});
});