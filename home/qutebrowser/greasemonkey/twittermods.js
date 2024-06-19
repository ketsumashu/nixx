// ==UserScript==
// @name         Hide Advertisement at X/Twitter site
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Hide specific advertisements at X/Twitter site
// @author       aspen138
// @match        *://x.com/*
// @match        *://*.x.com/*
// @match        *://twitter.com/*
// @match        *://*.twitter.com/*
// @grant        none
// @license    MIT
// ==/UserScript==
 
(function() {
    'use strict';
 
    // Function to hide ads
    function hideAds() {
        // Find all span elements that contain the text "Ad"
        document.querySelectorAll('span').forEach(span => {
            if (span.textContent.trim() === 'Ad') {
                // Find the closest parent article to the span and hide it
                let adArticle = span.closest('article');
                if (adArticle) {
                    adArticle.style.display = 'none';
                }
            }
        });
    }
 
    // Run the hideAds function on page load
    window.addEventListener('load', hideAds);
 
    // Optionally, to account for dynamic content loading
    setInterval(hideAds, 5000); // Check every 5 seconds
})();
