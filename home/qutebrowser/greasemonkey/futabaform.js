
// ==UserScript==
// @name         futaba-form-under
// @namespace    http://2chan.net/
// @version      0.6.2
// @description  ふたばちゃんねるのスレッド上でフォームを下に固定する
// @author       ame-chan
// @match        http://*.2chan.net/b/res/*
// @match        https://*.2chan.net/b/res/*
// @match        http://kako.futakuro.com/futa/*
// @match        https://kako.futakuro.com/futa/*
// @match        https://tsumanne.net/si/data/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=2chan.net
// @grant        GM_xmlhttpRequest
// @grant        GM_setValue
// @grant        GM_getValue
// @license      MIT
// @run-at       document-idle
// @connect      2chan.net
// @connect      img.2chan.net
// @connect      dec.2chan.net
// @require      https://cdn.jsdelivr.net/npm/exifreader@4.20.0/dist/exif-reader.min.js
// ==/UserScript==

const myform = document.getElementById("form");

myform.scrollIntoView({ behavior: "smooth"});
