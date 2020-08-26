/** 
 * 2019-2020 Konrad Kubala <000konrad000@gmail.com>
 * 
 * NOTICE OF LICENSE
 * 
 * This source file is subject to the AFL-3.0
 * that is bundled with this package in the file LICENSE.txt.
 * 
 * @author    Konrad Kubala <000konrad000@gmail.com>
 * @copyright 2007-2020 Konrad Kubala <000konrad000@gmail.com>
 * @license   AFL-3.0
 */

const CACHE_NAME = 'tarabuso';

const urlsToCache = [
  ''
];

self.addEventListener('install', (event) => {
  event.waitUntil(
		caches.open(CACHE_NAME)
		.then((cache) => {
			return cache.addAll(urlsToCache);
		})
	);
});

self.addEventListener('fetch', (event) => {
  event.respondWith(
		caches.match(event.request)
		.then((response) => {
			return response ? response : fetch(event.request);
		})
	);
});