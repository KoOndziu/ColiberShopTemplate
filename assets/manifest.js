return JSON.parse(`{
	"name": "json",
	"short_name": "<?=$shop.name?>",
	"start_url": "/?pwa=true",
	"display": "standalone",
	"theme_color": "#f00",
	"background_color": "#fff",
	"icons": [{
		"src": "images/touch/homescreen48.png",
		"sizes": "48x48",
		"type": "image/png"
	}, {
		"src": "images/touch/homescreen72.png",
		"sizes": "72x72",
		"type": "image/png"
	}, {
		"src": "images/touch/homescreen96.png",
		"sizes": "96x96",
		"type": "image/png"
	}, {
		"src": "images/touch/homescreen144.png",
		"sizes": "144x144",
		"type": "image/png"
	}, {
		"src": "images/touch/homescreen168.png",
		"sizes": "168x168",
		"type": "image/png"
	}, {
		"src": "images/touch/homescreen192.png",
		"sizes": "192x192",
		"type": "image/png"
	}]
}`);