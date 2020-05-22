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