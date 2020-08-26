/**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */
import 'bootstrap/js/src/util';
import 'bootstrap/js/src/alert';
import 'bootstrap/js/src/button';
import 'bootstrap/js/src/collapse';
import 'bootstrap/js/src/dropdown';
import 'bootstrap/js/src/modal';
import 'bootstrap/js/src/popover';
import 'bootstrap/js/src/tab';
import 'bootstrap-touchspin';
import 'tocca';

import './lib/slick.min';
import './lib/background-check.min';
import './lib/jquery.hoverIntent.min';

import BackgroundCheck from './lib/background-check.min';
import prestashop from 'prestashop';
import EventEmitter from 'events';
import lazysizes from 'lazysizes';

import SlickSlider from './components/slick';
import Form from './components/form';
import TopMenu from './components/top-menu';
import Utils from './components/utils';
import './components/darkmode';
import './components/block-cart';
import Ajax from './components/ajax';

import './checkout';
import './customer';
import './listing';
import './product';
import './cart';

// "inherit" EventEmitter
for (var i in EventEmitter.prototype) {
  prestashop[i] = EventEmitter.prototype[i];
}

$(document).ready(() => {	
  const form = new Form();
  const ajax = new Ajax();
	const $body = $('body');
  let slickSlider = new SlickSlider();
  let topMenuEl = $('#_desktop_top_menu #top-menu');
  let topMenu = new TopMenu(topMenuEl);
	let scrollbarWidth = (window.innerWidth - document.documentElement.clientWidth) + 'px';
	document.documentElement.style.setProperty('--scroll-width', scrollbarWidth);

  form.init();
  slickSlider.init();
  topMenu.init();
  Utils.createSpin();
	
  // register serviceWorker
	if ('serviceWorker' in navigator) {
		navigator.serviceWorker
		.register(prestashop.urls.theme_assets + 'js/service-worker.php', {
			scope: '/'
		})
		.then(function(registration) {
			// console.log('Registration successful, scope is:', registration.scope);
		})
		.catch(function(error) {
			// console.log('Service worker registration failed, error:', error);
		});
	}
  
  // check contrast between texts and images
  try {
		BackgroundCheck.init({ targets: '.check-text' });
	}
	catch(err) {
		console.log("BGcheck: " + err);
	}
	
  $body.on('click', '.card-header', (event) => {
    event.preventDefault();
    $($(event.target).data("target")).collapse();
  });
  
  // open modals
	$body.on('click', '.js-open-modal', (event) => {
    event.preventDefault();
    if ($(event.target).data("target")) {
      $('#' + $(event.target).data("target")).modal('show');
    } else {
      $(event.target).next('.modal').modal('show');
    }
  });
  
  $body.on('click', '.disabled', (event) => {event.preventDefault();});
	
	$(document).on('swipe', () => {
    console.log($('.modal-open').scrollTop());
  });
  
  let insrtBfr = () => {$('.product-images > div:last-child').insertBefore('.product-images > div:first-child')};
  let insrtAfr = () => {$('.product-images > div:first-child').insertAfter('.product-images > div:last-child')};
  
  $(document).on( 'click', '.product-images > div:nth-child(2)', insrtBfr);
  $(document).on( 'swipeleft', '.product-images', insrtAfr);
  $(document).on( 'click', '.product-images > div:nth-child(4)', insrtAfr);
  $(document).on( 'swiperight', '.product-images', insrtBfr);
  
});