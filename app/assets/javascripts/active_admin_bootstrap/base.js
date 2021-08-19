/**
 * Warning: This file is auto-generated, do not modify. Instead, make your changes in 'app/javascript/active_admin_bootstrap/' and run `yarn build`
 */
//= require @rails/ujs
//= require bootstrap
//= require bootstrap-icons
//= require flatpickr
//= require sortablejs
//= require tom-select
//= require @popperjs/core
//= require_self

(function(global, factory) {
  typeof exports === "object" && typeof module !== "undefined" ? factory(exports, require("bootstrap"), require("flatpickr"), require("tom-select"), require("@rails/ujs"), require("sortablejs")) : typeof define === "function" && define.amd ? define([ "exports", "bootstrap", "flatpickr", "tom-select", "@rails/ujs", "sortablejs" ], factory) : (global = typeof globalThis !== "undefined" ? globalThis : global || self, 
  factory(global.ActiveAdminBootstrap = {}, global.Bootstrap$1, global.flatpickr, global.TomSelect, global.Rails, global.Sortable));
})(this, function(exports, Bootstrap$1, flatpickr, TomSelect, Rails, Sortable) {
  "use strict";
  function _interopDefaultLegacy(e) {
    return e && typeof e === "object" && "default" in e ? e : {
      default: e
    };
  }
  function _interopNamespace(e) {
    if (e && e.__esModule) return e;
    var n = Object.create(null);
    if (e) {
      Object.keys(e).forEach(function(k) {
        if (k !== "default") {
          var d = Object.getOwnPropertyDescriptor(e, k);
          Object.defineProperty(n, k, d.get ? d : {
            enumerable: true,
            get: function() {
              return e[k];
            }
          });
        }
      });
    }
    n["default"] = e;
    return Object.freeze(n);
  }
  var Bootstrap__namespace = _interopNamespace(Bootstrap$1);
  var flatpickr__default = _interopDefaultLegacy(flatpickr);
  var TomSelect__default = _interopDefaultLegacy(TomSelect);
  var Rails__default = _interopDefaultLegacy(Rails);
  var Sortable__default = _interopDefaultLegacy(Sortable);
  function hasTurbolinks() {
    return typeof Turbolinks !== "undefined" && Turbolinks.supported;
  }
  function turbolinksVisit(params) {
    const path = [ window.location.pathname, "?", toQueryString(params) ].join("");
    Turbolinks.visit(path);
  }
  function queryString() {
    return (window.location.search || "").replace(/^\?/, "");
  }
  function queryStringToParams() {
    const decode = value => decodeURIComponent((value || "").replace(/\+/g, "%20"));
    return queryString().split("&").map(pair => pair.split("=")).map(([key, value]) => ({
      name: decode(key),
      value: decode(value)
    }));
  }
  function toHTMLAttrString(obj) {
    const object = obj || {};
    const arr = [];
    Object.keys(object).forEach(key => {
      let value = object[key];
      if (typeof value === "object") {
        value = JSON.stringify(value);
      }
      arr.push(`${key}='${value}'`);
    });
    return arr.join(" ");
  }
  function toQueryString(params) {
    const encode = value => encodeURIComponent(value || "");
    return params.map(({name: name, value: value}) => [ encode(name), encode(value) ]).map(pair => pair.join("=")).join("&");
  }
  function serializeArray(form) {
    const arr = [];
    Array.prototype.slice.call(form.elements).forEach(function(field) {
      if (!field.name || field.disabled || [ "file", "reset", "submit", "button" ].indexOf(field.type) > -1) return;
      if (field.type === "select-multiple") {
        Array.prototype.slice.call(field.options).forEach(function(option) {
          if (!option.selected) return;
          arr.push({
            name: field.name,
            value: option.value
          });
        });
        return;
      }
      if ([ "checkbox", "radio" ].indexOf(field.type) > -1 && !field.checked) return;
      arr.push({
        name: field.name,
        value: field.value
      });
    });
    return arr;
  }
  function serializeObject(form) {
    return serializeArray(form).reduce((obj, item) => {
      obj[item.name] = item.value;
      return obj;
    }, {});
  }
  function cookieSet(name, value, expireInSec) {
    const expireAt = new Date;
    expireAt.setTime(expireAt.getTime() + expireInSec * 1e3);
    document.cookie = `${name}=${value};expires=${expireAt.toGMTString()};path=/`;
  }
  function cookieGet(name) {
    const cookieName = `${name}=`;
    const ca = document.cookie.split(";");
    for (let i = 0; i < ca.length; i++) {
      let c = ca[i];
      while (c.charAt(0) === " ") c = c.substring(1, c.length);
      if (c.indexOf(cookieName) === 0) return c.substring(cookieName.length, c.length);
    }
    return null;
  }
  const FlatpickerInit = function(element) {
    element.querySelectorAll("[data-aa-datepicker]").forEach(element => {
      const options = JSON.parse(element.dataset.aaDatepicker || {});
      const defaults = {
        enableTime: true,
        altFormat: "Y-m-d, h:i K",
        altInput: true,
        dateFormat: "Y-m-d H:i:00",
        time_24hr: false
      };
      flatpickr__default["default"](element, {
        ...defaults,
        ...options
      });
    });
  };
  document.addEventListener("DOMContentLoaded", () => FlatpickerInit(document));
  const TomSelectInit = function(element) {
    element.querySelectorAll("[data-aa-tom-select]").forEach(element => {
      const options = JSON.parse(element.dataset.aaTomSelect || {});
      const defaults = {
        plugins: [ "remove_button", "restore_on_backspace" ],
        persist: false,
        createOnBlur: false,
        create: false
      };
      new TomSelect__default["default"](element, {
        ...defaults,
        ...options
      });
    });
  };
  document.addEventListener("DOMContentLoaded", () => TomSelectInit(document));
  class BaseInput {
    constructor(name, options) {
      this.name = name;
      this.options = options;
      this.wrapper_html_options = this.options.wrapper_html || {};
      this.label_html_options = this.options.label_html || {};
      this.input_html_options = this.options.input_html || {};
      this.label = options.label || name.charAt(0).toUpperCase() + name.slice(1);
    }
    _defaultWrapperHTMLOptions() {
      return {
        class: "mb-3"
      };
    }
    _wrapperHTMLOptions() {
      return {
        ...this._defaultWrapperHTMLOptions(),
        ...this.wrapper_html_options
      };
    }
    _defaultLabelHTMLOptions() {
      return {
        class: "form-label",
        for: `batch-form-${this.name}`
      };
    }
    _labelHTMLOptions() {
      return {
        ...this._defaultLabelHTMLOptions(),
        ...this.label_html_options
      };
    }
    _defaultInputHTMLOptions() {
      return {
        class: `form-control ${this.options.as}`,
        name: this.name,
        id: `batch-form-${this.name}`
      };
    }
    _inputHTMLOptions() {
      return {
        ...this._defaultInputHTMLOptions(),
        ...this.input_html_options
      };
    }
    _labelHTML() {
      return `<label ${toHTMLAttrString(this._labelHTMLOptions())}>${this.label}</label>`;
    }
    _inputHTML() {
      return `<input ${toHTMLAttrString(this._inputHTMLOptions())}>`;
    }
    _inputWrapping(html) {
      return `\n      <div ${toHTMLAttrString(this._wrapperHTMLOptions())}>${html}</div>\n    `;
    }
    render() {
      return this._inputWrapping(`\n      ${this._labelHTML()}\n      ${this._inputHTML()}\n    `);
    }
  }
  class BooleanInput extends BaseInput {
    _defaultLabelHTMLOptions() {
      const options = {
        class: "form-check-label"
      };
      return {
        ...super._defaultLabelHTMLOptions(),
        ...options
      };
    }
    _defaultInputHTMLOptions() {
      const options = {
        class: `form-check-input ${this.options.as}`,
        type: "checkbox"
      };
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
    _inputGroup(html) {
      return `<div class="form-check">${html}</div>`;
    }
    _inputWrapping(html) {
      return super._inputWrapping(this._inputGroup(html));
    }
  }
  class ChoicesInput extends BaseInput {
    _defaultLegendHTMLOptions() {
      return {
        class: "form-label"
      };
    }
    _legendHTMLOptions() {
      return {
        ...this._defaultLegendHTMLOptions(),
        ...this.legend_html_options
      };
    }
    _defaultLabelHTMLOptions() {
      const options = {
        class: "form-check-label"
      };
      return {
        ...super._defaultLabelHTMLOptions(),
        ...options
      };
    }
    _defaultInputHTMLOptions() {
      const options = {
        class: `form-check-input ${this.options.as}`
      };
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
    _inputHTMLOptions(value) {
      return {
        ...super._inputHTMLOptions(),
        ...{
          value: value,
          id: `batch-form-${this.name}-${value}`
        }
      };
    }
    _labelHTMLOptions(value) {
      return {
        ...super._labelHTMLOptions(),
        ...{
          for: `batch-form-${this.name}-${value}`
        }
      };
    }
    _wrapWith(html) {
      return `\n      <div class="form-check">${html}</div>\n    `;
    }
    _choices(collection) {
      return (() => {
        const result = [];
        collection.forEach(v => {
          let option;
          if (Array.isArray(v)) {
            option = this._wrapWith(`\n              ${this._inputHTML(v[1])}\n              ${this._labelHTML(v[0])}\n            `);
          } else {
            option = this._wrapWith(`\n              ${this._inputHTML(v)}\n              ${this._labelHTML(v)}\n            `);
          }
          result.push(option);
        });
        return result;
      })().join("");
    }
    _inputHTML(value) {
      return `<input ${toHTMLAttrString(this._inputHTMLOptions(value))}>`;
    }
    _labelHTML(value) {
      return `<label ${toHTMLAttrString(this._labelHTMLOptions(value))}>${value}</label>`;
    }
    _legendHTML() {
      return `<label ${toHTMLAttrString(this._legendHTMLOptions())}>${this.label}</label>`;
    }
    _choicesHTML() {
      const collection = this.options.collection || [];
      return collection.length ? this._choices(collection) : "";
    }
    render() {
      return this._inputWrapping(`\n      ${this._legendHTML()}\n      <div class="choices">${this._choicesHTML()}</div>\n    `);
    }
  }
  class CheckBoxesInput extends ChoicesInput {
    _defaultInputHTMLOptions() {
      const options = {
        name: `${this.name}[]`,
        type: "checkbox"
      };
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
  }
  class ColorInput extends BaseInput {
    _defaultInputHTMLOptions() {
      const options = {
        class: `form-control form-control-color ${this.options.as}`,
        type: "color"
      };
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
  }
  class SelectInput extends BaseInput {
    constructor(name, options) {
      super(name, options);
      this.multiple = this.options.multiple || false;
      this.tom_select = this.options.tom_select || false;
      this.include_blank = this.options.include_blank || false;
    }
    _divider() {
      return "-";
    }
    _defaultInputHTMLOptions() {
      const meta = document.querySelector('#meta-tags-for-js meta[name="inputs"]') || {};
      const content = JSON.parse(meta.content);
      const options = {
        class: `form-select ${this.options.as}`
      };
      if (this.multiple) {
        options.multiple = true;
      }
      if (this.tom_select) {
        if (typeof this.tom_select === "object") {
          options["data-aa-tom-select"] = this.tom_select;
        } else {
          options["data-aa-tom-select"] = content.tom_select;
        }
      }
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
    _blankOption() {
      let label = "";
      if (typeof this.include_blank === "string") {
        label = this.options.include_blank;
      }
      return `<option value>${label}</option>`;
    }
    _optionsForSelect(collection) {
      return (() => {
        const result = [];
        const _self = this;
        if (this.include_blank) result.push(this._blankOption());
        collection.forEach(v => {
          let option;
          if (Array.isArray(v)) {
            option = `<option value="${v[1]}">${v[0]}</option>`;
          } else if (v === _self._divider()) {
            option = '<option value="" disabled>-------------</option>';
          } else {
            option = `<option value="${v}">${v}</option>`;
          }
          result.push(option);
        });
        return result;
      })().join("");
    }
    _optionsHTML() {
      const collection = this.options.collection || [];
      return collection.length ? this._optionsForSelect(collection) : "";
    }
    _inputHTML() {
      return `<select ${toHTMLAttrString(this._inputHTMLOptions())}>${this._optionsHTML()}</select>`;
    }
  }
  class CountryInput extends SelectInput {
    constructor(name, options) {
      super(name, options);
      this.countries = this._getAllCountries();
      this.priorityCountries = this.options.priority_countries || [];
      this.exceptCountries = this.options.except || [];
      this.onlyCountries = this.options.only || [];
    }
    _exceptCountries() {
      const _self = this;
      if (Array.isArray(this.exceptCountries) && this.exceptCountries.length) {
        this.countries = this.countries.filter(function(item) {
          return !_self.exceptCountries.includes(item.code);
        });
      }
    }
    _onlyCountries() {
      const _self = this;
      if (Array.isArray(this.onlyCountries) && this.onlyCountries.length) {
        this.countries = this.countries.filter(function(item) {
          return _self.onlyCountries.includes(item.code);
        });
      }
    }
    _prioritizeCountries() {
      const priorityCountries = [];
      const _self = this;
      if (Array.isArray(this.priorityCountries) && this.priorityCountries.length) {
        this.priorityCountries.forEach(function(code) {
          const item = _self.countries.find(item => item.code === code);
          if (item) priorityCountries.push(item);
        });
        const restOfCountries = this.countries.filter(function(item) {
          return !priorityCountries.find(el => el.code === item.code);
        });
        this.countries = priorityCountries.concat(this._divider()).concat(restOfCountries);
      }
    }
    _getAllCountries() {
      const meta = document.querySelector('#meta-tags-for-js meta[name="countries"]') || {};
      const content = JSON.parse(meta.content);
      if (content.error) {
        console.error(content);
        return [];
      } else {
        return content;
      }
    }
    _formatCountries() {
      const _self = this;
      this.countries = this.countries.map(function(item) {
        if (item === _self._divider()) {
          return item;
        } else {
          return [ item.translated_name, item.name ];
        }
      });
    }
    _optionsHTML() {
      this._onlyCountries();
      this._exceptCountries();
      this._prioritizeCountries();
      this._formatCountries();
      const collection = this.countries;
      return collection.length ? this._optionsForSelect(collection) : "";
    }
    _inputHTML() {
      return `<select ${toHTMLAttrString(this._inputHTMLOptions())}>${this._optionsHTML()}</select>`;
    }
  }
  class DatalistInput extends BaseInput {
    _defaultInputHTMLOptions() {
      const options = {
        type: "text",
        list: `batch-form-${this.name}-datalist`
      };
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
    _optionsForSelect(collection) {
      return (() => {
        const result = [];
        collection.forEach(v => {
          let option;
          if (Array.isArray(v)) {
            option = `<option value=${v[1]}>${v[0]}</option>`;
          } else {
            option = `<option>${v}</option>`;
          }
          result.push(option);
        });
        return result;
      })().join("");
    }
    _optionsHTML() {
      const collection = this.options.collection || [];
      return collection.length ? this._optionsForSelect(collection) : "";
    }
    _inputHTML() {
      return `${super._inputHTML()}<datalist id="batch-form-${this.name}-datalist">${this._optionsHTML()}</datalist>`;
    }
  }
  class DatePickerInput extends BaseInput {
    _defaultInputHTMLOptions() {
      const meta = document.querySelector('#meta-tags-for-js meta[name="inputs"]') || {};
      const content = JSON.parse(meta.content);
      const options = {
        type: "text",
        "data-aa-datepicker": this.options.flatpickr || content.date_picker
      };
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
  }
  class DateTimePickerInput extends BaseInput {
    _defaultInputHTMLOptions() {
      const meta = document.querySelector('#meta-tags-for-js meta[name="inputs"]') || {};
      const content = JSON.parse(meta.content);
      const options = {
        type: "text",
        "data-aa-datepicker": this.options.flatpickr || content.datetime_picker
      };
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
  }
  class HiddenInput extends BaseInput {
    _defaultInputHTMLOptions() {
      const options = {
        type: "hidden"
      };
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
    _defaultWrapperHTMLOptions() {
      const options = {
        class: "d-none"
      };
      return {
        ...super._defaultWrapperHTMLOptions,
        ...options
      };
    }
  }
  class RadioInput extends ChoicesInput {
    _defaultInputHTMLOptions() {
      const options = {
        type: "radio"
      };
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
  }
  class StringInput extends BaseInput {
    _defaultInputHTMLOptions() {
      const options = {
        type: this.options.as === "phone" ? "tel" : this.options.as
      };
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
  }
  class SwitchInput extends BooleanInput {
    _inputGroup(html) {
      return `<div class="form-check form-switch">${html}</div>`;
    }
  }
  class TextInput extends BaseInput {
    _inputHTML() {
      return `\n      <textarea ${toHTMLAttrString(this._inputHTMLOptions())}></textarea>\n    `;
    }
  }
  class TimePickerInput extends BaseInput {
    _defaultInputHTMLOptions() {
      const options = {
        type: "time"
      };
      return {
        ...super._defaultInputHTMLOptions(),
        ...options
      };
    }
  }
  class TimeZoneInput extends SelectInput {
    constructor(name, options) {
      super(name, options);
      this.timeZones = this._getAllTimeZones();
      this.priorityTimeZones = this.options.priority_zones || [];
    }
    _prioritizeTimeZones() {
      const priorityTimeZones = [];
      const _self = this;
      if (Array.isArray(this.priorityTimeZones) && this.priorityTimeZones.length) {
        this.priorityTimeZones.forEach(function(zone) {
          const item = _self.timeZones.find(item => item.name === zone.name);
          if (item) priorityTimeZones.push(item);
        });
        const restOfTimeZones = this.timeZones.filter(function(item) {
          return !priorityTimeZones.find(el => el.name === item.name);
        });
        this.timeZones = priorityTimeZones.concat(this._divider()).concat(restOfTimeZones);
      }
    }
    _getAllTimeZones() {
      const meta = document.querySelector('#meta-tags-for-js meta[name="time_zones"]') || {};
      const content = JSON.parse(meta.content);
      if (content.error) {
        console.error(content);
        return [];
      } else {
        return content;
      }
    }
    _formatTimeZones() {
      const _self = this;
      this.timeZones = this.timeZones.map(function(item) {
        if (item === _self._divider()) {
          return item;
        } else {
          return [ item.translated_name, item.name ];
        }
      });
    }
    _optionsHTML() {
      this._prioritizeTimeZones();
      this._formatTimeZones();
      const collection = this.timeZones;
      return collection.length ? this._optionsForSelect(collection) : "";
    }
    _inputHTML() {
      return `<select ${toHTMLAttrString(this._inputHTMLOptions())}>${this._optionsHTML()}</select>`;
    }
  }
  class Input {
    constructor(name, options) {
      this.name = name;
      this.options = options;
    }
    _configs() {
      if (this._isExplicity()) {
        return {
          as: this.options.as,
          options: this.options
        };
      } else if (Array.isArray(this.options)) {
        return {
          as: "select",
          options: {
            collection: this.options
          }
        };
      } else {
        return {
          as: this.options,
          options: {}
        };
      }
    }
    _isExplicity() {
      return typeof this.options === "object" && this.options.as;
    }
    render() {
      let InputClass;
      const configs = this._configs();
      const as = configs.as;
      const options = configs.options;
      if (/^(string|number|password|url|phone)$/.test(as)) {
        InputClass = StringInput;
      } else if (as === "color") {
        InputClass = ColorInput;
      } else if (as === "hidden") {
        InputClass = HiddenInput;
      } else if (as === "text") {
        InputClass = TextInput;
      } else if (as === "datalist") {
        InputClass = DatalistInput;
      } else if (as === "switch") {
        InputClass = SwitchInput;
      } else if (as === "boolean") {
        InputClass = BooleanInput;
      } else if (as === "check_boxes") {
        InputClass = CheckBoxesInput;
      } else if (as === "radio") {
        InputClass = RadioInput;
      } else if (as === "select") {
        InputClass = SelectInput;
      } else if (as === "country") {
        InputClass = CountryInput;
      } else if (as === "time_zone") {
        InputClass = TimeZoneInput;
      } else if (/^(date_picker|datepicker)$/.test(as)) {
        InputClass = DatePickerInput;
      } else if (as === "time_picker") {
        InputClass = TimePickerInput;
      } else if (as === "datetime_picker") {
        InputClass = DateTimePickerInput;
      } else {
        throw new Error(`Unsupported input type: {${this.name}: ${as}}`);
      }
      return new InputClass(this.name, options).render();
    }
  }
  class ConfirmDialog {
    constructor(message, inputs, options, callback) {
      const defaults = {
        buttons: {
          ok: {
            text: "Confirm",
            class: "btn btn-primary"
          },
          cancel: {
            text: "Cancel",
            class: "btn btn-link"
          }
        }
      };
      this.message = message;
      this.inputs = inputs;
      this.callback = callback;
      this.events = {
        beforeOpen: new Event("confirm_dialog:before_open"),
        afterOpen: new Event("confirm_dialog:after_open")
      };
      this.options = {
        ...defaults,
        ...options
      };
      this._bind();
    }
    _template() {
      const buttons = this.options.buttons || {};
      const message = this.message ? `<p id="dialog-message">${this.message}</p>` : "";
      return `\n      <div id="modal-dialog-confirm" class='modal fade' tabindex='-1'>\n        <div class='modal-dialog modal-dialog-centered modal-dialog-scrollable'>\n          <div class='modal-content'>\n            <div class='modal-body'>\n              ${message}\n              ${this._form()}\n            </div>\n            <div class='modal-footer'>\n              <button type='button' class='${(buttons.cancel || {}).class}' data-bs-dismiss='modal'>${(buttons.cancel || {}).text}</button>\n              <button id="modal-dialog-confirm-button" type='button' class='${(buttons.ok || {}).class}'>${(buttons.ok || {}).text}</button>\n            </div>\n          </div>\n        </div>\n      </div>`;
    }
    _form() {
      let html = `<form id="modal-dialog-confirm-form" title="${this.message}">`;
      for (const name in this.inputs) {
        const options = this.inputs[name];
        html += new Input(name, options).render();
      }
      html += "</form>";
      return html;
    }
    _initPlugins(el) {
      FlatpickerInit(el);
      TomSelectInit(el);
    }
    _create() {
      const dialogNode = (new DOMParser).parseFromString(this._template(), "text/html").body.childNodes[0];
      return document.body.appendChild(dialogNode);
    }
    _bind() {
      const _self = this;
      const dialogEl = this._create();
      const dialogForm = dialogEl.querySelector("#modal-dialog-confirm-form") || {};
      const cancelButton = dialogEl.querySelector("#modal-dialog-confirm-button") || {};
      const beforeOpenEvent = this.events.beforeOpen;
      const afterOpenEvent = this.events.afterOpen;
      const serializeForm = serializeObject;
      const dialogConfirm = new Bootstrap$1.Modal(dialogEl, {
        keyboard: true,
        backdrop: "static"
      });
      cancelButton.addEventListener("click", function(e) {
        _self.callback(serializeForm(dialogForm));
        dialogConfirm.hide();
      });
      dialogEl.addEventListener("shown.bs.modal", function(_e) {
        _self._initPlugins(dialogEl);
      });
      dialogEl.addEventListener("hidden.bs.modal", function(_e) {
        dialogEl.remove();
      });
      beforeOpenEvent.detail = {
        dialogForm: dialogForm
      };
      afterOpenEvent.detail = {
        dialogForm: dialogForm
      };
      document.body.dispatchEvent(beforeOpenEvent);
      dialogConfirm.show();
      document.body.dispatchEvent(afterOpenEvent);
    }
  }
  class CheckboxToggler {
    constructor(container, options) {
      this.options = options;
      this.container = container;
      this._init();
      this._bind();
    }
    _init() {
      if (!this.container) {
        throw new Error("Container element not found");
      } else {
        this.$container = document.querySelector(this.container);
      }
      if (!this.$container.querySelector(".toggle_all")) {
        throw new Error('"toggle all" checkbox not found');
      } else {
        this.$toggleAllCheckbox = this.$container.querySelector(".toggle_all");
      }
      this.$checkboxes = this.$container.querySelectorAll('input[type="checkbox"]:not(.toggle_all)');
    }
    _bind() {
      this.$checkboxes.forEach(el => {
        el.addEventListener("change", e => {
          this._didChangeCheckbox(e.target);
        });
      });
      this.$toggleAllCheckbox.addEventListener("change", _e => {
        this._didChangeToggleAllCheckbox();
      });
    }
    _didChangeCheckbox(_checkbox) {
      const numChecked = [ ...this.$checkboxes ].filter(el => el.checked).length;
      const allChecked = numChecked === this.$checkboxes.length;
      const someChecked = numChecked > 0 && numChecked < this.$checkboxes.length;
      this.$toggleAllCheckbox.checked = allChecked;
      this.$toggleAllCheckbox.indeterminate = someChecked;
    }
    _didChangeToggleAllCheckbox() {
      const setting = this.$toggleAllCheckbox.checked;
      this.$checkboxes.forEach(el => {
        el.checked = setting;
      });
      return setting;
    }
  }
  class TableCheckboxToggler extends CheckboxToggler {
    _bind() {
      super._bind(...arguments);
      const $cells = this.$container.querySelectorAll("tbody td");
      $cells.forEach(el => {
        el.addEventListener("click", e => {
          if (e.target.type !== "checkbox") {
            this._didClickCell(e.target);
          }
        });
      });
    }
    _didChangeCheckbox(checkbox) {
      super._didChangeCheckbox(...arguments);
      if (checkbox.checked) {
        checkbox.closest("tr").classList.add("selected");
      } else {
        checkbox.closest("tr").classList.remove("selected");
      }
    }
    _didChangeToggleAllCheckbox() {
      const rows = this.$container.querySelectorAll("tbody tr");
      const checked = super._didChangeToggleAllCheckbox(...arguments);
      rows.forEach(row => {
        if (checked) {
          row.classList.add("selected");
        } else {
          row.classList.remove("selected");
        }
      });
    }
    _didClickCell(cell) {
      const $checkbox = cell.parentNode.querySelector('input[type="checkbox"]');
      if ($checkbox) $checkbox.click();
    }
  }
  class BatchActions {
    constructor(element) {
      this.element = element;
      this.modal = null;
      this.events = {
        confirm: new Event("confirm:complete")
      };
      this.options = {
        batchActionSelector: ".batch_actions_selector",
        collection: ".paginated_collection",
        toggler: "#collection_selection_toggle_all"
      };
      this._bind();
    }
    _bindLinks() {
      const $elements = this.element.querySelectorAll(`${this.options.batchActionSelector} li a`);
      const _self = this;
      $elements.forEach(el => {
        el.addEventListener("click", e => {
          const el = e.target;
          const dialogOptions = JSON.parse(el.dataset.aaConfirmDialog || "{}");
          let message;
          e.stopPropagation();
          e.preventDefault();
          if (message = el.dataset.confirm) {
            this.modal = new ConfirmDialog(message, JSON.parse(el.dataset.inputs), dialogOptions, function(inputs) {
              const event = _self.events.confirm;
              event.detail = {
                inputs: inputs
              };
              el.dispatchEvent(event);
            });
          }
        });
      });
    }
    _bindConfirm() {
      const $elements = this.element.querySelectorAll(`${this.options.batchActionSelector} li a`);
      $elements.forEach(el => {
        el.addEventListener(this.events.confirm.type, function(e) {
          let value;
          const $batchActionInputs = document.getElementById("batch_action_inputs");
          const inputs = (e.detail || {}).inputs;
          e.stopPropagation();
          e.preventDefault();
          if (value = JSON.stringify(inputs)) {
            $batchActionInputs.removeAttribute("disabled");
            $batchActionInputs.value = value;
          } else {
            $batchActionInputs.setAttribute("disabled", "disabled");
          }
          document.getElementById("batch_action").value = e.target.dataset.action;
          document.getElementById("collection_selection").submit();
        });
      });
    }
    _bindSelector() {
      const $indexTable = this.element.querySelector(`${this.options.collection} table.index_table`);
      const $batchActionSelector = this.element.querySelector(this.options.batchActionSelector);
      const $toggleAll = this.element.querySelector(this.options.toggler);
      const $checkboxes = this.element.querySelectorAll(`${this.options.collection} input[type="checkbox"]`);
      const $toggler = this.element.querySelector(`${this.options.batchActionSelector} .dropdown-toggle`);
      if ($batchActionSelector && $toggleAll) {
        if ($indexTable) {
          this.tableCheckboxToggler = new TableCheckboxToggler(`${this.options.collection} table.index_table`);
        } else {
          this.checkboxToggler = new CheckboxToggler(this.options.collection);
        }
      }
      $checkboxes.forEach(el => {
        el.addEventListener("change", _e => {
          if (this.element.querySelectorAll(`${this.options.collection} input[type="checkbox"]:checked`).length) {
            $toggler.classList.remove("disabled");
          } else {
            $toggler.classList.add("disabled");
          }
        });
      });
    }
    _bind() {
      this._bindLinks();
      this._bindConfirm();
      this._bindSelector();
    }
  }
  document.addEventListener("DOMContentLoaded", () => {
    const el = document.getElementById("main");
    if (el) window.BatchActions = new BatchActions(el);
  });
  let __SkipConfirmation = false;
  Rails__default["default"].confirm = function(message, element) {
    const options = JSON.parse(element.dataset.aaConfirmDialog || "{}");
    const inputs = JSON.parse(element.dataset.inputs || "{}");
    if (__SkipConfirmation) return true;
    function onConfirm() {
      __SkipConfirmation = true;
      element.click();
      __SkipConfirmation = false;
    }
    window.confirmDialog = new ConfirmDialog(message, inputs, options, onConfirm);
    return false;
  };
  document.addEventListener("DOMContentLoaded", () => {
    const shouldToggle = document.body.classList.contains("layout-navigation-sidebar") || document.body.classList.contains("layout-navigation-aside");
    if (shouldToggle) {
      document.querySelectorAll("#header .dropdown-toggle.active").forEach(element => {
        const dropdown = Bootstrap.Dropdown.getOrCreateInstance(element);
        dropdown.show();
        element.blur();
      });
    }
  });
  class Filters {
    static _clearForm(event) {
      const regex = /^(q\[|q%5B|q%5b|page|utf8|commit)/;
      const params = queryStringToParams().filter(({name: name}) => !name.match(regex));
      event.preventDefault();
      if (hasTurbolinks()) {
        turbolinksVisit(params);
      } else {
        window.location.search = toQueryString(params);
      }
    }
    static _disableEmptyInputFields(event) {
      const elements = [ ...this.querySelectorAll("input, textarea, select, button") ].filter(input => input.value === "");
      const params = serializeArray(this);
      elements.forEach(el => {
        el.disabled = true;
      });
      if (hasTurbolinks()) {
        event.preventDefault();
        turbolinksVisit(params);
      }
    }
    static _setSearchType() {
      const $element = this.closest(".filter_form_field").querySelector("input");
      $element.name = `q[${this.value}]`;
    }
  }
  document.addEventListener("DOMContentLoaded", () => {
    const $clearFilterBtn = document.querySelector(".clear_filters_btn");
    const $filterForm = document.querySelector(".filter_form");
    const $selectAndSearch = document.querySelectorAll(".filter_form_field.select_and_search select");
    if ($clearFilterBtn) $clearFilterBtn.addEventListener("click", Filters._clearForm);
    if ($filterForm) $filterForm.addEventListener("submit", Filters._disableEmptyInputFields);
    $selectAndSearch.forEach(select => select.addEventListener("change", Filters._setSearchType));
  });
  class HasMany {
    constructor(element) {
      this.element = element;
      this.events = {
        removeBefore: new Event("has_many_remove:before"),
        removeAfter: new Event("has_many_remove:after"),
        addBefore: new Event("has_many_add:before"),
        addAfter: new Event("has_many_add:after")
      };
      this.options = {
        list: ".has-many-list",
        item: "fieldset.has_many_fields",
        addLink: "a.button.has_many_add",
        removeLink: "a.button.has_many_remove",
        destroyInput: 'input[name$="[_destroy]"]'
      };
      this._bind();
    }
    _initSortable() {
      this.sortable = new Sortable__default["default"](document.querySelector(this.options.list), {
        handle: ".handle",
        animation: 150,
        ghostClass: "sortable-placeholder",
        dragClass: "sortable-drag",
        onUpdate: () => {
          this._recomputePosition();
        }
      });
    }
    _recomputePosition() {
      const inputName = this.element.dataset.sortable;
      const $items = this.element.querySelectorAll(this.options.item);
      let position = parseInt(this.element.dataset.sortableStart || 0, 10);
      $items.forEach(el => {
        const destroyInput = el.querySelector(this.options.destroyInput) || {};
        const sortableInput = el.querySelector(`input[name$='[${inputName}]']`) || {};
        if (sortableInput) {
          sortableInput.value = destroyInput.checked ? "" : position++;
        }
      });
    }
    _bindDestroyEvent(el) {
      el.addEventListener("change", e => this._recomputePosition());
    }
    _bindAddEvent(el) {
      el.addEventListener("click", e => {
        let beforeAdd;
        const el = e.target;
        const parent = this.element;
        e.preventDefault();
        parent.dispatchEvent(beforeAdd = this.events.addBefore, [ parent ]);
        if (!beforeAdd.defaultPrevented) {
          let index = parent.dataset.hasManyIndex || parent.querySelectorAll(this.options.item).length - 1;
          parent.setAttribute("data-has-many-index", ++index);
          const regex = new RegExp(el.dataset.placeholder, "g");
          const html = el.dataset.html.replaceAll(regex, index);
          const newNode = document.createElement("div");
          newNode.innerHTML = html;
          const fieldset = newNode.firstElementChild;
          const $list = this.element.querySelector(this.options.list);
          $list.appendChild(fieldset);
          this._bindEvents(fieldset);
          this._recomputePosition();
          const addAfterEvent = this.events.addAfter;
          addAfterEvent.detail = {
            fieldset: fieldset,
            parent: parent
          };
          return parent.dispatchEvent(this.events.addAfter);
        }
      });
    }
    _bindRemoveEvent(el) {
      el.addEventListener("click", e => {
        const el = e.target;
        const parent = this.element;
        const fieldset = el.closest(this.options.item);
        const removeBeforeEvent = this.events.removeBefore;
        const removeAfterEvent = this.events.removeAfter;
        e.preventDefault();
        this._recomputePosition();
        removeBeforeEvent.detail = {
          fieldset: fieldset,
          parent: parent
        };
        removeAfterEvent.detail = {
          fieldset: fieldset,
          parent: parent
        };
        parent.dispatchEvent(removeBeforeEvent);
        fieldset.remove();
        return parent.dispatchEvent(removeAfterEvent);
      });
    }
    _bindEvents(el) {
      const $addLinks = el.querySelectorAll(this.options.addLink);
      const $removeLinks = el.querySelectorAll(this.options.removeLink);
      const $destroyInputs = el.querySelectorAll(this.options.destroyInput);
      $addLinks.forEach(el => this._bindAddEvent(el));
      $removeLinks.forEach(el => this._bindRemoveEvent(el));
      $destroyInputs.forEach(el => this._bindDestroyEvent(el));
    }
    _bind() {
      this._bindEvents(this.element);
      this._initSortable();
    }
  }
  document.addEventListener("DOMContentLoaded", () => {
    const $hasManyContainers = document.querySelectorAll(".has_many_container");
    $hasManyContainers.forEach(el => new HasMany(el));
  });
  class HeaderToggler {
    constructor(element, options) {
      const defaults = {
        container: "body",
        activeClass: "header-active",
        cookieName: "header-state",
        cookieExpireSec: 30 * 24 * 60 * 60
      };
      this.element = element;
      this.options = {
        ...defaults,
        ...options
      };
      this._bind();
    }
    _add() {
      const $container = document.querySelector(this.options.container);
      $container.classList.add(this.options.activeClass);
      cookieSet(this.options.cookieName, this.options.activeClass, this.options.cookieExpireSec);
    }
    _remove() {
      const $container = document.querySelector(this.options.container);
      $container.classList.remove(this.options.activeClass);
      cookieSet(this.options.cookieName, null, 0);
    }
    _bind() {
      const cookie = cookieGet(this.options.cookieName);
      const $breakpointHelper = document.querySelector(".breakpoint-up-helper");
      const $container = document.querySelector(this.options.container);
      const _self = this;
      if (cookie === this.options.activeClass && window.getComputedStyle($breakpointHelper).visibility === "visible") {
        this._add();
      }
      this.element.addEventListener("click", function(e) {
        e.preventDefault();
        if ($container.classList.contains(_self.options.activeClass)) {
          _self._remove();
        } else {
          _self._add();
        }
      });
    }
  }
  document.addEventListener("DOMContentLoaded", () => {
    const $togglers = document.querySelectorAll("[data-aa-header-toggler]");
    window.headerTogglers = [];
    $togglers.forEach(el => {
      const options = JSON.parse(el.dataset.aaHeaderToggler || {});
      window.headerTogglers.push(new HeaderToggler(el, options));
    });
  });
  class InputCounter {
    constructor(element, options) {
      const defaults = {
        type: "letter",
        containerClass: ".input-counter-container",
        charCountClass: ".input-counter-char-count",
        charLeftClass: ".input-counter-char-left",
        charLimitClass: ".input-counter-char-limit",
        limit: 150
      };
      this.element = element;
      this.options = {
        ...defaults,
        ...options
      };
      this._bind();
    }
    _count() {
      const el = this.element;
      const limit = this.options.limit;
      let count = 0;
      let left = limit;
      let trimmedText;
      if (el.value) {
        if (this.options.type === "word") {
          count = el.value.split(" ").length;
        } else {
          count = el.value.length;
        }
      }
      if (count >= limit) {
        if (this.options.type === "word") {
          trimmedText = el.value.split(" ").slice(0, limit).join(" ");
        } else {
          trimmedText = el.value.substring(0, limit);
        }
        el.value = trimmedText;
        left = 0;
        count = limit;
      } else {
        left = limit - count;
      }
      this._update(count, left);
    }
    _update(count, left) {
      const limit = this.options.limit;
      const elContainer = this.element.closest(this.options.containerClass);
      const elCount = elContainer.querySelector(this.options.charCountClass);
      const elLeft = elContainer.querySelector(this.options.charLeftClass);
      const elLimit = elContainer.querySelector(this.options.charLimitClass);
      if (elCount) elCount.innerHTML = count.toString();
      if (elLeft) elLeft.innerHTML = left.toString();
      if (elLimit) elLimit.innerHTML = limit.toString();
    }
    _bind() {
      this._count();
      this.element.addEventListener("keyup", _e => this._count());
    }
  }
  const InputCounterInit = function(element) {
    window.inputCounters = [];
    element.querySelectorAll("[data-aa-input-counter]").forEach(el => {
      const options = JSON.parse(el.dataset.aaInputCounter || {});
      window.inputCounters.push(new InputCounter(el, options));
    });
  };
  document.addEventListener("DOMContentLoaded", () => InputCounterInit(document));
  class PerPage {
    static _update(event) {
      const params = queryStringToParams().filter(({name: name}) => name !== "per_page" && name !== "page");
      params.push({
        name: "per_page",
        value: this.value
      });
      if (hasTurbolinks()) {
        event.preventDefault();
        turbolinksVisit(params);
      } else {
        window.location.search = toQueryString(params);
      }
    }
  }
  document.addEventListener("DOMContentLoaded", () => {
    const $selector = document.querySelector(".pagination_per_page select");
    if ($selector) $selector.addEventListener("change", PerPage._update);
  });
  window.Bootstrap = Bootstrap__namespace;
  exports.ConfirmDialog = ConfirmDialog;
  Object.defineProperty(exports, "__esModule", {
    value: true
  });
});
