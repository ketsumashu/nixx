
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

const DEFAULT_FORM_WIDTH = 0;
const DEFAULT_FLOAT_HEIGHT = 100;
const DEFAULT_FLOAT_WIDTH = 2;
const DEFAULT_NO_HIDE_IF_TEXT = true;
const DEFAULT_DEFAULT_HIDE_PIXEL = 1000;
const DEFAULT_USE_MOUSE_CHECK = true;
const DEFAULT_RANGE_TYPE_PIXEL = true;
const DEFAULT_HIDE_AFTER_SUBMIT = false;
const DEFAULT_LOCK_FLOAT_FORM = false;
const DEFAULT_USE_IME_CONTROL = false;
const DEFAULT_LEFT_TOP = false;
const DEFAULT_RIGHT_TOP = false;
const DEFAULT_LEFT_BOTTOM = false;
const DEFAULT_RIGHT_BOTTOM = true;
const DEFAULT_SHOW_RANGE_X_IN_PIXEL = 500;
const DEFAULT_HIDE_RANGE_X_IN_PIXEL = 550;
const DEFAULT_SHOW_RANGE_Y_IN_PIXEL = 500;
const DEFAULT_HIDE_RANGE_Y_IN_PIXEL = 550;
const DEFAULT_SHOW_RANGE_X_IN_PERCENT = 25;
const DEFAULT_HIDE_RANGE_X_IN_PERCENT = 30;
const DEFAULT_SHOW_RANGE_Y_IN_PERCENT = 50;
const DEFAULT_HIDE_RANGE_Y_IN_PERCENT = 60;
let form_width = DEFAULT_FORM_WIDTH;
let float_height = DEFAULT_FLOAT_HEIGHT;
let float_width = DEFAULT_FLOAT_WIDTH;
let no_hide_if_text = DEFAULT_NO_HIDE_IF_TEXT;
let default_hide_pixel = DEFAULT_DEFAULT_HIDE_PIXEL;
let use_mouse_check = DEFAULT_USE_MOUSE_CHECK;
let range_type_pixel = DEFAULT_RANGE_TYPE_PIXEL;
let hide_after_submit = DEFAULT_HIDE_AFTER_SUBMIT;
let lock_float_form = DEFAULT_LOCK_FLOAT_FORM;
let use_ime_control = DEFAULT_USE_IME_CONTROL;
let left_top = DEFAULT_LEFT_TOP;
let right_top = DEFAULT_RIGHT_TOP;
let left_bottom = DEFAULT_LEFT_BOTTOM;
let right_bottom = DEFAULT_RIGHT_BOTTOM;
let show_range_x_in_pixel = DEFAULT_SHOW_RANGE_X_IN_PIXEL;
let hide_range_x_in_pixel = DEFAULT_HIDE_RANGE_X_IN_PIXEL;
let show_range_y_in_pixel = DEFAULT_SHOW_RANGE_Y_IN_PIXEL;
let hide_range_y_in_pixel = DEFAULT_HIDE_RANGE_Y_IN_PIXEL;
let show_range_x_in_percent = DEFAULT_SHOW_RANGE_X_IN_PERCENT;
let hide_range_x_in_percent = DEFAULT_HIDE_RANGE_X_IN_PERCENT;
let show_range_y_in_percent = DEFAULT_SHOW_RANGE_Y_IN_PERCENT;
let hide_range_y_in_percent = DEFAULT_HIDE_RANGE_Y_IN_PERCENT;
let form = null;
let textarea = null;
let toggle = null;
let lock_button = null;
let have_focus = false;
let mx = 0;
let my = 0;
let locked = false;
let right = right_top || right_bottom;
let bottom = left_bottom || right_bottom;

function onMouseMove(e) {
    mx = e.clientX;
    my = e.clientY;

    if(!use_mouse_check || locked){
        return;
    }

    if (isHide() && isShowable()) {
        show();
    } else if(isShow() && isHidable()){
        hide();
    }
}

function onFocus(e){
    have_focus = true;

    if(isHide() &&isShowable()){
        show();
    }
}

function onBlur(e){
    have_focus = false;
}

function isShow(){
    return form.style.display != "none";
}

function isHide(){
    return form.style.display == "none";
}

// must show:true
function isShowable() {
    let cw = document.documentElement.clientWidth;
    let ch = document.documentElement.clientHeight;
    let x = mx;
    let y = my;
    if (right) x = cw - mx;
    if (bottom) y = ch - my;

    if (range_type_pixel) {
        if ((x < show_range_x_in_pixel) && (y < show_range_y_in_pixel)) {
            return true;
        } else {
            return false;
        }
    } else {
        let px = Math.abs(100.0 * x / cw);
        let py = Math.abs(100.0 * y / ch);

        if ((px < show_range_x_in_percent) && (py < show_range_y_in_percent)) {
            return true;
        } else {
            return false;
        }
    }
}

// must hide:true
function isHidable() {
    let cw = document.documentElement.clientWidth;
    let ch = document.documentElement.clientHeight;
    let x = mx;
    let y = my;
    if (right) x = cw - mx;
    if (bottom) y = ch - my;

    if (no_hide_if_text) {
        if(have_focus){
            return false;
        }

        if (textarea.value.length != 0) {
            return false;
        }
    }

    if (!use_mouse_check) return true;
    if (range_type_pixel) {
        if ((x > hide_range_x_in_pixel) || (y > hide_range_y_in_pixel)) {
            return true;
        } else {
            return false;
        }
    } else {
        let px = Math.abs(100.0 * x / cw);
        let py = Math.abs(100.0 * y / ch);

        if ((px > hide_range_x_in_percent) || (py > hide_range_y_in_percent)) {
            return true;
        } else {
            return false;
        }
    }
}

function setFormStyle(form_display) {
    form.style = {};
    form.style.visibility = "visible";
    form.style.zIndex = 100;
    form.style.backgroundColor = "#FFFFEE";
    form.style.border = "solid 1px";
    form.style.position = "fixed";
    if (right) {
        form.style.left = "";
        form.style.right = `${float_width}px`;
    } else {
        form.style.right = "";
        form.style.left = `${float_width}px`;
    }
    if (bottom) {
        form.style.top = "";
        form.style.bottom = `${float_height + 28}px`;
    } else {
        form.style.bottom = "";
        form.style.top = `${float_height + 28}px`;
    }
    if (form_width > 0) {
        form.style.maxWidth = `${form_width}px`;
        form.style.width = `${form_width}px`;
        textarea.style.width = "100%";
        textarea.style.boxSizing = "border-box";
    } else {
        form.style.maxWidth = "";
        form.style.width = "";
        textarea.style.width = "";
    }
    form.style.display = form_display;
}

function show() {
    setFormStyle("table");
    toggle.value = "隠す";
}

function hide() {
    setFormStyle("none");
    toggle.value = "表示";
}

function isForm(target) {
    for (let elm = target; elm; elm = elm.parentElement) {
        if (elm.id == "ftbl") return true;
    }
    return false;
}

function safeGetValue(value, default_value) {
    return value === undefined ? default_value : value;
}

function onError(error) {
    // 
}

function onLoadSetting(result) {
    form_width = Number(safeGetValue(result.form_width, DEFAULT_FORM_WIDTH));
    float_height = Number(safeGetValue(result.float_height, DEFAULT_FLOAT_HEIGHT));
    float_width = Number(safeGetValue(result.float_width, DEFAULT_FLOAT_WIDTH));
    no_hide_if_text = safeGetValue(result.no_hide_if_text, DEFAULT_NO_HIDE_IF_TEXT);
    default_hide_pixel = safeGetValue(result.default_hide_pixel, DEFAULT_DEFAULT_HIDE_PIXEL);
    use_mouse_check = safeGetValue(result.use_mouse_check, DEFAULT_USE_MOUSE_CHECK);
    range_type_pixel = safeGetValue(result.range_type_pixel, DEFAULT_RANGE_TYPE_PIXEL);
    hide_after_submit = safeGetValue(result.hide_after_submit, DEFAULT_HIDE_AFTER_SUBMIT);
    lock_float_form = safeGetValue(result.lock_float_form, DEFAULT_LOCK_FLOAT_FORM);
    use_ime_control = safeGetValue(result.use_ime_control, DEFAULT_USE_IME_CONTROL);
    left_top = safeGetValue(result.left_top, DEFAULT_LEFT_TOP);
    right_top = safeGetValue(result.right_top, DEFAULT_RIGHT_TOP);
    left_bottom = safeGetValue(result.left_bottom, DEFAULT_LEFT_BOTTOM);
    right_bottom = safeGetValue(result.right_bottom, DEFAULT_RIGHT_BOTTOM);
    show_range_x_in_pixel = safeGetValue(result.show_range_x_in_pixel, DEFAULT_SHOW_RANGE_X_IN_PIXEL);
    hide_range_x_in_pixel = safeGetValue(result.hide_range_x_in_pixel, DEFAULT_HIDE_RANGE_X_IN_PIXEL);
    show_range_y_in_pixel = safeGetValue(result.show_range_y_in_pixel, DEFAULT_SHOW_RANGE_Y_IN_PIXEL);
    hide_range_y_in_pixel = safeGetValue(result.hide_range_y_in_pixel, DEFAULT_HIDE_RANGE_Y_IN_PIXEL);
    show_range_x_in_percent = safeGetValue(result.show_range_x_in_percent, DEFAULT_SHOW_RANGE_X_IN_PERCENT);
    hide_range_x_in_percent = safeGetValue(result.hide_range_x_in_percent, DEFAULT_HIDE_RANGE_X_IN_PERCENT);
    show_range_y_in_percent = safeGetValue(result.show_range_y_in_percent, DEFAULT_SHOW_RANGE_Y_IN_PERCENT);
    hide_range_y_in_percent = safeGetValue(result.hide_range_y_in_percent, DEFAULT_HIDE_RANGE_Y_IN_PERCENT);

    right = right_top || right_bottom;
    bottom = left_bottom || right_bottom;

    main();
}

function onChangeSetting(changes, areaName) {
    if (areaName != "local") {
        return;
    }

    form_width = Number(safeGetValue(changes.form_width.newValue, form_width));
    float_height = Number(safeGetValue(changes.float_height.newValue, float_height));
    float_width = Number(safeGetValue(changes.float_width.newValue, float_width));
    no_hide_if_text = safeGetValue(changes.no_hide_if_text.newValue, no_hide_if_text);
    default_hide_pixel = safeGetValue(changes.default_hide_pixel.newValue, DEFAULT_DEFAULT_HIDE_PIXEL);
    use_mouse_check = safeGetValue(changes.use_mouse_check.newValue, DEFAULT_USE_MOUSE_CHECK);
    range_type_pixel = safeGetValue(changes.range_type_pixel.newValue, range_type_pixel);
    hide_after_submit = safeGetValue(changes.hide_after_submit.newValue, DEFAULT_HIDE_AFTER_SUBMIT);
    lock_float_form = safeGetValue(changes.lock_float_form.newValue, DEFAULT_LOCK_FLOAT_FORM);
    use_ime_control = safeGetValue(changes.use_ime_control.newValue, DEFAULT_USE_IME_CONTROL);
    left_top = safeGetValue(changes.left_top.newValue, DEFAULT_LEFT_TOP);
    right_top = safeGetValue(changes.right_top.newValue, DEFAULT_RIGHT_TOP);
    left_bottom = safeGetValue(changes.left_bottom.newValue, DEFAULT_LEFT_BOTTOM);
    right_bottom = safeGetValue(changes.right_bottom.newValue, DEFAULT_RIGHT_BOTTOM);
    show_range_x_in_pixel = safeGetValue(changes.show_range_x_in_pixel.newValue, show_range_x_in_pixel);
    hide_range_x_in_pixel = safeGetValue(changes.hide_range_x_in_pixel.newValue, hide_range_x_in_pixel);
    show_range_y_in_pixel = safeGetValue(changes.show_range_y_in_pixel.newValue, show_range_y_in_pixel);
    hide_range_y_in_pixel = safeGetValue(changes.hide_range_y_in_pixel.newValue, hide_range_y_in_pixel);
    show_range_x_in_percent = safeGetValue(changes.show_range_x_in_percent.newValue, show_range_x_in_percent);
    hide_range_x_in_percent = safeGetValue(changes.hide_range_x_in_percent.newValue, hide_range_x_in_percent);
    show_range_y_in_percent = safeGetValue(changes.show_range_y_in_percent.newValue, show_range_y_in_percent);
    hide_range_y_in_percent = safeGetValue(changes.hide_range_y_in_percent.newValue, hide_range_y_in_percent);

    right = right_top || right_bottom;
    bottom = left_bottom || right_bottom;

    if (right) {
        form.style.left = "";
        form.style.right = `${float_width}px`;
        lock_button.style.left = "";
        lock_button.style.right = `${float_width}px`;
        toggle.style.left = "";
        toggle.style.right = `${float_width + 26}px`;
    } else {
        form.style.right = "";
        form.style.left = `${float_width}px`;
        lock_button.style.right = "";
        lock_button.style.left = `${float_width}px`;
        toggle.style.right = "";
        toggle.style.left = `${float_width + 26}px`;
    }

    if (bottom) {
        form.style.top = "";
        form.style.bottom = `${float_height + 28}px`;
        lock_button.style.top = "";
        lock_button.style.bottom = `${float_height + 2}px`;
        toggle.style.top = "";
        toggle.style.bottom = `${float_height}px`;
    } else {
        form.style.bottom = "";
        form.style.top = `${float_height + 28}px`;
        lock_button.style.bottom = "";
        lock_button.style.top = `${float_height + 2}px`;
        toggle.style.bottom = "";
        toggle.style.top = `${float_height}px`;
    }

    if (form_width > 0) {
        form.style.maxWidth = `${form_width}px`;
        form.style.width = `${form_width}px`;
        textarea.style.width = "100%";
        textarea.style.boxSizing = "border-box";
    } else {
        form.style.maxWidth = "";
        form.style.width = "";
        textarea.style.width = "";
    }

    textarea.style.imeMode = use_ime_control ? "active" : "auto";
}

function main() {
    form = document.getElementById("ftbl");
    textarea = document.getElementById("ftxa");

    toggle = document.getElementById("KOSHIAN_float_form_toggle");
    if (toggle) {
        toggle.parentElement.removeChild(toggle);
    }
    toggle = document.createElement("input");
    toggle.id = "KOSHIAN_float_form_toggle";

    locked = lock_float_form;
    lock_button = document.getElementById("KOSHIAN_float_form_lock_button");
    if (lock_button) {
        lock_button.parentElement.removeChild(lock_button);
    }
    lock_button = document.createElement("div");
    lock_button.id = "KOSHIAN_float_form_lock_button";
    lock_button.style.position = "fixed";
    if (right) {
        lock_button.style.right = `${float_width}px`;
    } else {
        lock_button.style.left = `${float_width}px`;
    }
    if (bottom) {
        lock_button.style.bottom = `${float_height + 2}px`;
    } else {
        lock_button.style.top = `${float_height + 2}px`;
    }
    lock_button.style.width = `24px`;
    lock_button.style.height = `24px`;

    let icon_unlock = document.createElement("img");
    icon_unlock.src = browser.extension.getURL("icons/key_unlock.png");
    icon_unlock.hidden = locked;
    icon_unlock.style.width = "100%";

    let icon_lock = document.createElement("img");
    icon_lock.src = browser.extension.getURL("icons/key_lock.png");
    icon_lock.hidden = !locked;
    icon_lock.style.width = "100%";

    lock_button.onclick = (e) => {
        locked = !locked;
        icon_unlock.hidden = locked;
        icon_lock.hidden = !locked;
    }
    lock_button.appendChild(icon_unlock);
    lock_button.appendChild(icon_lock);
    document.body.appendChild(lock_button);


    if (form == null || textarea == null || toggle == null) {
        return;
    }

    if (document.documentElement.clientWidth > default_hide_pixel) {
        show();
    } else {
        hide();
    }

    toggle.style.position = "fixed";
    if (right) {
        toggle.style.right = `${float_width + 26}px`;
    } else {
        toggle.style.left = `${float_width + 26}px`;
    }
    if (bottom) {
        toggle.style.bottom = `${float_height}px`;
    } else {
        toggle.style.top = `${float_height}px`;
    }
    toggle.style.display = "block";
    toggle.type = "button";
    toggle.onclick = (e) => {
        if (isHide()) {
            show();
        } else {
            hide();
        }
    };

    document.body.appendChild(toggle);

    textarea.style.imeMode = use_ime_control ? "active" : "auto";

    window.addEventListener("resize", (e) => {
        setFormStyle(form.style.display);
    });

    // 
    let input_elems = form.getElementsByTagName("input");
    for(let i = 0; i < input_elems.length; ++i){
        input_elems[i].addEventListener("focus", onFocus);
        input_elems[i].addEventListener("blur", onBlur);
    }
    textarea.addEventListener("focus", onFocus);
    textarea.addEventListener("blur", onBlur);

    window.addEventListener("mousemove", onMouseMove);

    // フォーム位置切り替えを無効化
    let switch_form = document.getElementById("reszb");
    if (switch_form) {
        switch_form.onclick = (e) => { };
        switch_form.style.textDecoration = "line-through";
    }

    // cookieが効いてる場合フォームが移動するのでリセットを掛ける
    setTimeout(() => {
        if (document.documentElement.clientWidth > default_hide_pixel) {
            show();
        } else {
            hide();
        }
    }, 10);

    setTimeout(() => {
        if (document.documentElement.clientWidth > default_hide_pixel) {
            show();
        } else {
            hide();
        }
    }, 100);

    setTimeout(() => {
        if (document.documentElement.clientWidth > default_hide_pixel) {
            show();
        } else {
            hide();
        }
    }, 300);

    setTimeout(() => {
        if (document.documentElement.clientWidth > default_hide_pixel) {
            show();
        } else {
            hide();
        }
    }, 1000);

    document.addEventListener("KOSHIAN_quote", () => {
        show();
        textarea.focus();
    });

    document.addEventListener("KOSHIAN_form_loaded", () => {
        if (hide_after_submit) {
            hide();
        }
    });

    document.addEventListener("click", (e) => {
        let target = e.target;
        if (target == toggle || target == icon_lock || target == icon_unlock) {
            return;
        }

        if (target && target.nodeType == Node.ELEMENT_NODE) {
            if (target.classList.contains("pdms")) {
                // 記事番号プルダウンメニュー
                switch (target.textContent) {
                    case "本文を引用":
                    case "発言No.を引用":
                    case "画像ファイル名を引用":
                        show();
                        textarea.focus();
                        break;
                }
                return;
            } else if (target.classList.contains("slp1")) {
                // 選択文字列引用ポップアップボタン
                switch (target.textContent) {
                    case "引用する":
                        show();
                        textarea.focus();
                        break;
                }
                return;
            }
        }
    
        if (!locked && isShow() && isHidable() && !isForm(target)) {
            hide();
        }
    });
}

browser.storage.local.get().then(onLoadSetting, onError);
browser.storage.onChanged.addListener(onChangeSetting);
