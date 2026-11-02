// Service Worker v9.3 - Aab-e-Khizri PWA
const CACHE_NAME = 'aab-khizri-v9.3';
const ASSETS = [
    './',
    './index.html',
    './manifest.json',
    './version.json',
    './icon-192-user.png',
    './icon-512-user.png'
];

self.addEventListener('install', (e) => {
    e.waitUntil(
        caches.open(CACHE_NAME).then((cache) => cache.addAll(ASSETS))
    );
});

self.addEventListener('fetch', (e) => {
    e.respondWith(
        caches.match(e.request).then((res) => res || fetch(e.request))
    );
});
