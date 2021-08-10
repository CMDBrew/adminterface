/* eslint-disable */
/**
 * Warning: This file is auto-generated, do not modify. Instead, make your changes in 'app/javascript/active_admin_bootstrap/' and run `yarn build`
 */
//= require @rails/ujs
//= require bootstrap
//= require bootstrap-icons
//= require flatpickr
//= require sortablejs
//= require tom-select

(function(global, factory) {
  typeof exports === "object" && typeof module !== "undefined" ? factory(require("bootstrap"), require("@rails/ujs")) : typeof define === "function" && define.amd ? define([ "bootstrap", "@rails/ujs" ], factory) : (global = typeof globalThis !== "undefined" ? globalThis : global || self, 
  factory(global.Bootstrap, global.Rails));
})(this, function(Bootstrap, Rails) {
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
  var Bootstrap__namespace = _interopNamespace(Bootstrap);
  var Rails__default = _interopDefaultLegacy(Rails);
  function commonjsRequire() {
    throw new Error("Dynamic requires are not currently supported by rollup-plugin-commonjs");
  }
  const initializers = commonjsRequire.context(".", true, /\.js$/);
  initializers.keys().forEach(initializers);
  window.Bootstrap = Bootstrap__namespace;
  Rails__default["default"].start();
});
