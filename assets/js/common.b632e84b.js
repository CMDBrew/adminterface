/*! For license information please see common.b632e84b.js.LICENSE.txt */
(self.webpackChunkwebsite=self.webpackChunkwebsite||[]).push([[592],{3905:function(e,t,n){"use strict";n.d(t,{Zo:function(){return s},kt:function(){return d}});var r=n(7294);function o(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function a(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?a(Object(n),!0).forEach((function(t){o(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):a(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function u(e,t){if(null==e)return{};var n,r,o=function(e,t){if(null==e)return{};var n,r,o={},a=Object.keys(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||(o[n]=e[n]);return o}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(o[n]=e[n])}return o}var c=r.createContext({}),l=function(e){var t=r.useContext(c),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},s=function(e){var t=l(e.components);return r.createElement(c.Provider,{value:t},e.children)},f={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},p=r.forwardRef((function(e,t){var n=e.components,o=e.mdxType,a=e.originalType,c=e.parentName,s=u(e,["components","mdxType","originalType","parentName"]),p=l(n),d=o,v=p["".concat(c,".").concat(d)]||p[d]||f[d]||a;return n?r.createElement(v,i(i({ref:t},s),{},{components:n})):r.createElement(v,i({ref:t},s))}));function d(e,t){var n=arguments,o=t&&t.mdxType;if("string"==typeof e||o){var a=n.length,i=new Array(a);i[0]=p;var u={};for(var c in t)hasOwnProperty.call(t,c)&&(u[c]=t[c]);u.originalType=e,u.mdxType="string"==typeof e?e:o,i[1]=u;for(var l=2;l<a;l++)i[l]=n[l];return r.createElement.apply(null,i)}return r.createElement.apply(null,n)}p.displayName="MDXCreateElement"},4973:function(e,t,n){"use strict";n.d(t,{Z:function(){return f},I:function(){return s}});var r=n(7294),o=/{\w+}/g,a="{}";function i(e,t){var n=[],i=e.replace(o,(function(e){var o=e.substr(1,e.length-2),i=null==t?void 0:t[o];if(void 0!==i){var u=r.isValidElement(i)?i:String(i);return n.push(u),a}return e}));return 0===n.length?e:n.every((function(e){return"string"==typeof e}))?i.split(a).reduce((function(e,t,r){var o;return e.concat(t).concat(null!==(o=n[r])&&void 0!==o?o:"")}),""):i.split(a).reduce((function(e,t,o){return[].concat(e,[r.createElement(r.Fragment,{key:o},t,n[o])])}),[])}function u(e){var t=e.children,n=e.values;if("string"!=typeof t)throw console.warn("Illegal <Interpolate> children",t),new Error("The Docusaurus <Interpolate> component only accept simple string values");return i(t,n)}var c=n(7529);function l(e){var t,n=e.id,r=e.message;return null!==(t=c[null!=n?n:r])&&void 0!==t?t:r}function s(e,t){var n,r=e.message;return i(null!==(n=l({message:r,id:e.id}))&&void 0!==n?n:r,t)}function f(e){var t,n=e.children,o=e.id,a=e.values;if("string"!=typeof n)throw console.warn("Illegal <Translate> children",n),new Error("The Docusaurus <Translate> component only accept simple string values");var i=null!==(t=l({message:n,id:o}))&&void 0!==t?t:n;return r.createElement(u,{values:a},i)}},8143:function(e,t,n){"use strict";n.r(t),n.d(t,{BrowserRouter:function(){return r.VK},HashRouter:function(){return r.UT},Link:function(){return r.rU},MemoryRouter:function(){return r.VA},NavLink:function(){return r.OL},Prompt:function(){return r.NL},Redirect:function(){return r.l_},Route:function(){return r.AW},Router:function(){return r.F0},StaticRouter:function(){return r.gx},Switch:function(){return r.rs},generatePath:function(){return r.Gn},matchPath:function(){return r.LX},useHistory:function(){return r.k6},useLocation:function(){return r.TH},useParams:function(){return r.UO},useRouteMatch:function(){return r.$B},withRouter:function(){return r.EN}});var r=n(3727)},8084:function(e,t,n){"use strict";n.r(t),n.d(t,{default:function(){return o},useAllPluginInstancesData:function(){return a},usePluginData:function(){return i}});var r=n(2263);function o(){var e=(0,r.Z)().globalData;if(!e)throw new Error("Docusaurus global data not found.");return e}function a(e){var t=o()[e];if(!t)throw new Error('Docusaurus plugin global data not found for "'+e+'" plugin.');return t}function i(e,t){void 0===t&&(t="default");var n=a(e)[t];if(!n)throw new Error('Docusaurus plugin global data not found for "'+e+'" plugin with id "'+t+'".');return n}},8408:function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.getDocVersionSuggestions=t.getActiveDocContext=t.getActiveVersion=t.getLatestVersion=t.getActivePlugin=void 0;var r=n(8143);t.getActivePlugin=function(e,t,n){void 0===n&&(n={});var o=Object.entries(e).find((function(e){e[0];var n=e[1];return!!r.matchPath(t,{path:n.path,exact:!1,strict:!1})})),a=o?{pluginId:o[0],pluginData:o[1]}:void 0;if(!a&&n.failfast)throw new Error("Can't find active docs plugin for \""+t+'" pathname, while it was expected to be found. Maybe you tried to use a docs feature that can only be used on a docs-related page? Existing docs plugin paths are: '+Object.values(e).map((function(e){return e.path})).join(", "));return a};t.getLatestVersion=function(e){return e.versions.find((function(e){return e.isLast}))};t.getActiveVersion=function(e,n){var o=t.getLatestVersion(e);return[].concat(e.versions.filter((function(e){return e!==o})),[o]).find((function(e){return!!r.matchPath(n,{path:e.path,exact:!1,strict:!1})}))};t.getActiveDocContext=function(e,n){var o,a,i=t.getActiveVersion(e,n),u=null==i?void 0:i.docs.find((function(e){return!!r.matchPath(n,{path:e.path,exact:!0,strict:!1})}));return{activeVersion:i,activeDoc:u,alternateDocVersions:u?(o=u.id,a={},e.versions.forEach((function(e){e.docs.forEach((function(t){t.id===o&&(a[e.name]=t)}))})),a):{}}};t.getDocVersionSuggestions=function(e,n){var r=t.getLatestVersion(e),o=t.getActiveDocContext(e,n);return{latestDocSuggestion:null==o?void 0:o.alternateDocVersions[r.name],latestVersionSuggestion:r}}},6730:function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.useDocVersionSuggestions=t.useActiveDocContext=t.useActiveVersion=t.useLatestVersion=t.useVersions=t.useActivePluginAndVersion=t.useActivePlugin=t.useDocsData=t.useAllDocsData=void 0;var r=n(655),o=n(8143),a=r.__importStar(n(8084)),i=n(8408),u={};t.useAllDocsData=function(){var e;return null!==(e=a.default()["docusaurus-plugin-content-docs"])&&void 0!==e?e:u};t.useDocsData=function(e){return a.usePluginData("docusaurus-plugin-content-docs",e)};t.useActivePlugin=function(e){void 0===e&&(e={});var n=t.useAllDocsData(),r=o.useLocation().pathname;return i.getActivePlugin(n,r,e)};t.useActivePluginAndVersion=function(e){void 0===e&&(e={});var n=t.useActivePlugin(e),r=o.useLocation().pathname;if(n)return{activePlugin:n,activeVersion:i.getActiveVersion(n.pluginData,r)}};t.useVersions=function(e){return t.useDocsData(e).versions};t.useLatestVersion=function(e){var n=t.useDocsData(e);return i.getLatestVersion(n)};t.useActiveVersion=function(e){var n=t.useDocsData(e),r=o.useLocation().pathname;return i.getActiveVersion(n,r)};t.useActiveDocContext=function(e){var n=t.useDocsData(e),r=o.useLocation().pathname;return i.getActiveDocContext(n,r)};t.useDocVersionSuggestions=function(e){var n=t.useDocsData(e),r=o.useLocation().pathname;return i.getDocVersionSuggestions(n,r)}},6848:function(e,t,n){"use strict";n.d(t,{Z:function(){return A}});var r=n(7462),o=n(7294),a=n(6010),i={plain:{backgroundColor:"#2a2734",color:"#9a86fd"},styles:[{types:["comment","prolog","doctype","cdata","punctuation"],style:{color:"#6c6783"}},{types:["namespace"],style:{opacity:.7}},{types:["tag","operator","number"],style:{color:"#e09142"}},{types:["property","function"],style:{color:"#9a86fd"}},{types:["tag-id","selector","atrule-id"],style:{color:"#eeebff"}},{types:["attr-name"],style:{color:"#c4b9fe"}},{types:["boolean","string","entity","url","attr-value","keyword","control","directive","unit","statement","regex","at-rule","placeholder","variable"],style:{color:"#ffcc99"}},{types:["deleted"],style:{textDecorationLine:"line-through"}},{types:["inserted"],style:{textDecorationLine:"underline"}},{types:["italic"],style:{fontStyle:"italic"}},{types:["important","bold"],style:{fontWeight:"bold"}},{types:["important"],style:{color:"#c4b9fe"}}]},u={Prism:n(7410).Z,theme:i};function c(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function l(){return(l=Object.assign||function(e){for(var t=1;t<arguments.length;t++){var n=arguments[t];for(var r in n)Object.prototype.hasOwnProperty.call(n,r)&&(e[r]=n[r])}return e}).apply(this,arguments)}var s=/\r\n|\r|\n/,f=function(e){0===e.length?e.push({types:["plain"],content:"\n",empty:!0}):1===e.length&&""===e[0].content&&(e[0].content="\n",e[0].empty=!0)},p=function(e,t){var n=e.length;return n>0&&e[n-1]===t?e:e.concat(t)},d=function(e,t){var n=e.plain,r=Object.create(null),o=e.styles.reduce((function(e,n){var r=n.languages,o=n.style;return r&&!r.includes(t)||n.types.forEach((function(t){var n=l({},e[t],o);e[t]=n})),e}),r);return o.root=n,o.plain=l({},n,{backgroundColor:null}),o};function v(e,t){var n={};for(var r in e)Object.prototype.hasOwnProperty.call(e,r)&&-1===t.indexOf(r)&&(n[r]=e[r]);return n}var g=function(e){function t(){for(var t=this,n=[],r=arguments.length;r--;)n[r]=arguments[r];e.apply(this,n),c(this,"getThemeDict",(function(e){if(void 0!==t.themeDict&&e.theme===t.prevTheme&&e.language===t.prevLanguage)return t.themeDict;t.prevTheme=e.theme,t.prevLanguage=e.language;var n=e.theme?d(e.theme,e.language):void 0;return t.themeDict=n})),c(this,"getLineProps",(function(e){var n=e.key,r=e.className,o=e.style,a=l({},v(e,["key","className","style","line"]),{className:"token-line",style:void 0,key:void 0}),i=t.getThemeDict(t.props);return void 0!==i&&(a.style=i.plain),void 0!==o&&(a.style=void 0!==a.style?l({},a.style,o):o),void 0!==n&&(a.key=n),r&&(a.className+=" "+r),a})),c(this,"getStyleForToken",(function(e){var n=e.types,r=e.empty,o=n.length,a=t.getThemeDict(t.props);if(void 0!==a){if(1===o&&"plain"===n[0])return r?{display:"inline-block"}:void 0;if(1===o&&!r)return a[n[0]];var i=r?{display:"inline-block"}:{},u=n.map((function(e){return a[e]}));return Object.assign.apply(Object,[i].concat(u))}})),c(this,"getTokenProps",(function(e){var n=e.key,r=e.className,o=e.style,a=e.token,i=l({},v(e,["key","className","style","token"]),{className:"token "+a.types.join(" "),children:a.content,style:t.getStyleForToken(a),key:void 0});return void 0!==o&&(i.style=void 0!==i.style?l({},i.style,o):o),void 0!==n&&(i.key=n),r&&(i.className+=" "+r),i})),c(this,"tokenize",(function(e,t,n,r){var o={code:t,grammar:n,language:r,tokens:[]};e.hooks.run("before-tokenize",o);var a=o.tokens=e.tokenize(o.code,o.grammar,o.language);return e.hooks.run("after-tokenize",o),a}))}return e&&(t.__proto__=e),t.prototype=Object.create(e&&e.prototype),t.prototype.constructor=t,t.prototype.render=function(){var e=this.props,t=e.Prism,n=e.language,r=e.code,o=e.children,a=this.getThemeDict(this.props),i=t.languages[n];return o({tokens:function(e){for(var t=[[]],n=[e],r=[0],o=[e.length],a=0,i=0,u=[],c=[u];i>-1;){for(;(a=r[i]++)<o[i];){var l=void 0,d=t[i],v=n[i][a];if("string"==typeof v?(d=i>0?d:["plain"],l=v):(d=p(d,v.type),v.alias&&(d=p(d,v.alias)),l=v.content),"string"==typeof l){var g=l.split(s),y=g.length;u.push({types:d,content:g[0]});for(var h=1;h<y;h++)f(u),c.push(u=[]),u.push({types:d,content:g[h]})}else i++,t.push(d),n.push(l),r.push(0),o.push(l.length)}i--,t.pop(),n.pop(),r.pop(),o.pop()}return f(u),c}(void 0!==i?this.tokenize(t,r,i,n):[r]),className:"prism-code language-"+n,style:void 0!==a?a.root:{},getLineProps:this.getLineProps,getTokenProps:this.getTokenProps})},t}(o.Component);var y=n(7594),h=n.n(y),m={plain:{color:"#bfc7d5",backgroundColor:"#292d3e"},styles:[{types:["comment"],style:{color:"rgb(105, 112, 152)",fontStyle:"italic"}},{types:["string","inserted"],style:{color:"rgb(195, 232, 141)"}},{types:["number"],style:{color:"rgb(247, 140, 108)"}},{types:["builtin","char","constant","function"],style:{color:"rgb(130, 170, 255)"}},{types:["punctuation","selector"],style:{color:"rgb(199, 146, 234)"}},{types:["variable"],style:{color:"rgb(191, 199, 213)"}},{types:["class-name","attr-name"],style:{color:"rgb(255, 203, 107)"}},{types:["tag","deleted"],style:{color:"rgb(255, 85, 114)"}},{types:["operator"],style:{color:"rgb(137, 221, 255)"}},{types:["boolean"],style:{color:"rgb(255, 88, 116)"}},{types:["keyword"],style:{fontStyle:"italic"}},{types:["doctype"],style:{color:"rgb(199, 146, 234)",fontStyle:"italic"}},{types:["namespace"],style:{color:"rgb(178, 204, 214)"}},{types:["url"],style:{color:"rgb(221, 221, 221)"}}]},b=n(5350),w=n(3018),P=function(){var e=(0,w.LU)().prism,t=(0,b.Z)().isDarkTheme,n=e.theme||m,r=e.darkTheme||n;return t?r:n},k=n(4973),O="codeBlockContainer_K1bP",E="codeBlockContent_hGly",D="codeBlockTitle_eoMF",j="codeBlock_23N8",_="copyButton_Ue-o",x="codeBlockLines_39YC",S=/{([\d,-]+)}/,C=function(e){void 0===e&&(e=["js","jsBlock","jsx","python","html"]);var t={js:{start:"\\/\\/",end:""},jsBlock:{start:"\\/\\*",end:"\\*\\/"},jsx:{start:"\\{\\s*\\/\\*",end:"\\*\\/\\s*\\}"},python:{start:"#",end:""},html:{start:"\x3c!--",end:"--\x3e"}},n=["highlight-next-line","highlight-start","highlight-end"].join("|"),r=e.map((function(e){return"(?:"+t[e].start+"\\s*("+n+")\\s*"+t[e].end+")"})).join("|");return new RegExp("^\\s*(?:"+r+")\\s*$")};function A(e){var t=e.children,n=e.className,i=e.metastring,c=e.title,l=(0,w.LU)().prism,s=(0,o.useState)(!1),f=s[0],p=s[1],d=(0,o.useState)(!1),v=d[0],y=d[1];(0,o.useEffect)((function(){y(!0)}),[]);var m=(0,w.bc)(i)||c,b=(0,o.useRef)(null),A=[],T=P(),L=Array.isArray(t)?t.join(""):t;if(i&&S.test(i)){var V=i.match(S)[1];A=h()(V).filter((function(e){return e>0}))}var R=n&&n.replace(/language-/,"");!R&&l.defaultLanguage&&(R=l.defaultLanguage);var N=L.replace(/\n$/,"");if(0===A.length&&void 0!==R){for(var I,Z="",M=function(e){switch(e){case"js":case"javascript":case"ts":case"typescript":return C(["js","jsBlock"]);case"jsx":case"tsx":return C(["js","jsBlock","jsx"]);case"html":return C(["js","jsBlock","html"]);case"python":case"py":return C(["python"]);default:return C()}}(R),F=L.replace(/\n$/,"").split("\n"),B=0;B<F.length;){var z=B+1,U=F[B].match(M);if(null!==U){switch(U.slice(1).reduce((function(e,t){return e||t}),void 0)){case"highlight-next-line":Z+=z+",";break;case"highlight-start":I=z;break;case"highlight-end":Z+=I+"-"+(z-1)+","}F.splice(B,1)}else B+=1}A=h()(Z),N=F.join("\n")}var H=function(){!function(e,t){var n=(void 0===t?{}:t).target,r=void 0===n?document.body:n,o=document.createElement("textarea"),a=document.activeElement;o.value=e,o.setAttribute("readonly",""),o.style.contain="strict",o.style.position="absolute",o.style.left="-9999px",o.style.fontSize="12pt";var i=document.getSelection(),u=!1;i.rangeCount>0&&(u=i.getRangeAt(0)),r.append(o),o.select(),o.selectionStart=0,o.selectionEnd=e.length;var c=!1;try{c=document.execCommand("copy")}catch(l){}o.remove(),u&&(i.removeAllRanges(),i.addRange(u)),a&&a.focus()}(N),p(!0),setTimeout((function(){return p(!1)}),2e3)};return o.createElement(g,(0,r.Z)({},u,{key:String(v),theme:T,code:N,language:R}),(function(e){var t=e.className,n=e.style,i=e.tokens,u=e.getLineProps,c=e.getTokenProps;return o.createElement("div",{className:O},m&&o.createElement("div",{style:n,className:D},m),o.createElement("div",{className:(0,a.Z)(E,R)},o.createElement("pre",{tabIndex:0,className:(0,a.Z)(t,j,"thin-scrollbar"),style:n},o.createElement("code",{className:x},i.map((function(e,t){1===e.length&&""===e[0].content&&(e[0].content="\n");var n=u({line:e,key:t});return A.includes(t+1)&&(n.className+=" docusaurus-highlight-code-line"),o.createElement("span",(0,r.Z)({key:t},n),e.map((function(e,t){return o.createElement("span",(0,r.Z)({key:t},c({token:e,key:t})))})))})))),o.createElement("button",{ref:b,type:"button","aria-label":(0,k.I)({id:"theme.CodeBlock.copyButtonAriaLabel",message:"Copy code to clipboard",description:"The ARIA label for copy code blocks button"}),className:(0,a.Z)(_,"clean-btn"),onClick:H},f?o.createElement(k.Z,{id:"theme.CodeBlock.copied",description:"The copied button label on code blocks"},"Copied"):o.createElement(k.Z,{id:"theme.CodeBlock.copy",description:"The copy button label on code blocks"},"Copy"))))}))}},2924:function(e,t,n){"use strict";var r=n(7294).createContext(void 0);t.Z=r},9443:function(e,t,n){"use strict";var r=(0,n(7294).createContext)(void 0);t.Z=r},5350:function(e,t,n){"use strict";var r=n(7294),o=n(2924);t.Z=function(){var e=(0,r.useContext)(o.Z);if(null==e)throw new Error('"useThemeContext" is used outside of "Layout" component. Please see https://docusaurus.io/docs/api/themes/configuration#usethemecontext.');return e}},3018:function(e,t,n){"use strict";n.d(t,{pl:function(){return he},zF:function(){return B},HX:function(){return g},PO:function(){return X},L5:function(){return ie},Cv:function(){return ee},Cn:function(){return Y},kM:function(){return fe},WA:function(){return l},os:function(){return y},Mg:function(){return b},_f:function(){return s},bc:function(){return v},l5:function(){return p},nT:function(){return me},uR:function(){return L},J:function(){return le},Oh:function(){return se},be:function(){return be},SL:function(){return x},g8:function(){return Q},c2:function(){return j},D9:function(){return _},LU:function(){return o},pe:function(){return w}});var r=n(2263);function o(){return(0,r.Z)().siteConfig.themeConfig}var a="localStorage";function i(e){if(void 0===e&&(e=a),"undefined"==typeof window)throw new Error("Browser storage is not available on Node.js/Docusaurus SSR process.");if("none"===e)return null;try{return window[e]}catch(n){return t=n,u||(console.warn("Docusaurus browser storage is not available.\nPossible reasons: running Docusaurus in an iframe, in an incognito browser session, or using too strict browser privacy settings.",t),u=!0),null}var t}var u=!1;var c={get:function(){return null},set:function(){},del:function(){}};var l=function(e,t){if("undefined"==typeof window)return function(e){function t(){throw new Error('Illegal storage API usage for storage key "'+e+'".\nDocusaurus storage APIs are not supposed to be called on the server-rendering process.\nPlease only call storage APIs in effects and event handlers.')}return{get:t,set:t,del:t}}(e);var n=i(null==t?void 0:t.persistence);return null===n?c:{get:function(){return n.getItem(e)},set:function(t){return n.setItem(e,t)},del:function(){return n.removeItem(e)}}};function s(e){void 0===e&&(e=a);var t=i(e);if(!t)return[];for(var n=[],r=0;r<t.length;r+=1){var o=t.key(r);null!==o&&n.push(o)}return n}var f=n(5977);function p(){var e=(0,r.Z)(),t=e.siteConfig,n=t.baseUrl,o=t.url,a=e.i18n,i=a.defaultLocale,u=a.currentLocale,c=(0,f.TH)().pathname,l=u===i?n:n.replace("/"+u+"/","/"),s=c.replace(n,"");return{createUrl:function(e){var t=e.locale;return""+(e.fullyQualified?o:"")+function(e){return e===i?""+l:""+l+e+"/"}(t)+s}}}var d=/title=(["'])(.*?)\1/;function v(e){var t,n;return null!==(n=null===(t=null==e?void 0:e.match(d))||void 0===t?void 0:t[2])&&void 0!==n?n:""}var g="default";function y(e,t){return"docs-"+e+"-"+t}var h=n(6730),m=!!h.useAllDocsData,b=function(e,t){var n=function(e){return!e||(null==e?void 0:e.endsWith("/"))?e:e+"/"};return n(e)===n(t)},w=function(e){var t=(0,r.Z)().siteConfig,n=void 0===t?{}:t,o=n.title,a=n.titleDelimiter,i=void 0===a?"|":a;return e&&e.trim().length?e.trim()+" "+i+" "+o:o},P=n(7294),k=["zero","one","two","few","many","other"];function O(e){return k.filter((function(t){return e.includes(t)}))}var E={locale:"en",pluralForms:O(["one","other"]),select:function(e){return 1===e?"one":"other"}};function D(){var e=(0,r.Z)().i18n.currentLocale;return(0,P.useMemo)((function(){if(!Intl.PluralRules)return console.error("Intl.PluralRules not available!\nDocusaurus will fallback to a default/fallback (English) Intl.PluralRules implementation.\n        "),E;try{return t=e,n=new Intl.PluralRules(t),{locale:t,pluralForms:O(n.resolvedOptions().pluralCategories),select:function(e){return n.select(e)}}}catch(r){return console.error('Failed to use Intl.PluralRules for locale "'+e+'".\nDocusaurus will fallback to a default/fallback (English) Intl.PluralRules implementation.\n'),E}var t,n}),[e])}function j(){var e=D();return{selectMessage:function(t,n){return function(e,t,n){var r=e.split("|");if(1===r.length)return r[0];r.length>n.pluralForms.length&&console.error("For locale="+n.locale+", a maximum of "+n.pluralForms.length+" plural forms are expected ("+n.pluralForms+"), but the message contains "+r.length+" plural forms: "+e+" ");var o=n.select(t),a=n.pluralForms.indexOf(o);return r[Math.min(a,r.length-1)]}(n,t,e)}}}function _(e){var t=(0,P.useRef)();return(0,P.useEffect)((function(){t.current=e})),t.current}function x(e){var t=(0,f.TH)(),n=_(t),r=(0,P.useRef)(!0);(0,P.useEffect)((function(){r.current?r.current=!1:e({location:t,previousLocation:n})}),[t])}var S=n(3366),C=n(412),A=["collapsed"],T=["lazy"];function L(e){var t=e.initialState,n=(0,P.useState)(null!=t&&t),r=n[0],o=n[1],a=(0,P.useCallback)((function(){o((function(e){return!e}))}),[]);return{collapsed:r,setCollapsed:o,toggleCollapsed:a}}var V={display:"none",overflow:"hidden",height:"0px"},R={display:"block",overflow:"visible",height:"auto"};function N(e,t){var n=t?V:R;e.style.display=n.display,e.style.overflow=n.overflow,e.style.height=n.height}function I(e){var t=e.collapsibleRef,n=e.collapsed,r=e.animation,o=(0,P.useRef)(!1);(0,P.useEffect)((function(){var e,a=t.current;function i(){var e,t,n=a.scrollHeight;return{transition:"height "+(null!==(e=null==r?void 0:r.duration)&&void 0!==e?e:function(e){var t=e/36;return Math.round(10*(4+15*Math.pow(t,.25)+t/5))}(n))+"ms "+(null!==(t=null==r?void 0:r.easing)&&void 0!==t?t:"ease-in-out"),height:n+"px"}}function u(){var e=i();a.style.transition=e.transition,a.style.height=e.height}if(!o.current)return N(a,n),void(o.current=!0);return a.style.willChange="height",e=requestAnimationFrame((function(){n?(u(),requestAnimationFrame((function(){a.style.height=V.height,a.style.overflow=V.overflow}))):(a.style.display="block",requestAnimationFrame((function(){u()})))})),function(){return cancelAnimationFrame(e)}}),[t,n,r])}function Z(e){if(!C.Z.canUseDOM)return e?V:R}function M(e){var t=e.as,n=void 0===t?"div":t,r=e.collapsed,o=e.children,a=e.animation,i=e.onCollapseTransitionEnd,u=e.className,c=e.disableSSRStyle,l=(0,P.useRef)(null);return I({collapsibleRef:l,collapsed:r,animation:a}),P.createElement(n,{ref:l,style:c?void 0:Z(r),onTransitionEnd:function(e){if("height"===e.propertyName){var t=l.current,n=t.style.height;r||parseInt(n,10)!==t.scrollHeight||(N(t,!1),null==i||i(!1)),n===V.height&&(N(t,!0),null==i||i(!0))}},className:u},o)}function F(e){var t=e.collapsed,n=(0,S.Z)(e,A),r=(0,P.useState)(!t),o=r[0],a=r[1];(0,P.useLayoutEffect)((function(){t||a(!0)}),[t]);var i=(0,P.useState)(t),u=i[0],c=i[1];return(0,P.useLayoutEffect)((function(){o&&c(t)}),[o,t]),o?P.createElement(M,Object.assign({},n,{collapsed:u})):null}function B(e){var t=e.lazy,n=(0,S.Z)(e,T),r=t?F:M;return P.createElement(r,Object.assign({},n))}var z=n(6010),U="details_2Ziz",H="isClient_1Fil",$="collapsibleContent_3OHp",G=["summary","children"];function W(e){return!!e&&("SUMMARY"===e.tagName||W(e.parentElement))}function q(e,t){return!!e&&(e===t||q(e.parentElement,t))}var X=function(e){var t,n=e.summary,o=e.children,a=(0,S.Z)(e,G),i=(0,r.Z)().isClient,u=(0,P.useRef)(null),c=L({initialState:!a.open}),l=c.collapsed,s=c.setCollapsed,f=(0,P.useState)(a.open),p=f[0],d=f[1];return P.createElement("details",Object.assign({},a,{ref:u,open:p,"data-collapsed":l,className:(0,z.Z)(U,(t={},t[H]=i,t),a.className),onMouseDown:function(e){W(e.target)&&e.detail>1&&e.preventDefault()},onClick:function(e){e.stopPropagation();var t=e.target;W(t)&&q(t,u.current)&&(e.preventDefault(),l?(s(!1),d(!0)):s(!0))}}),n,P.createElement(B,{lazy:!1,collapsed:l,disableSSRStyle:!0,onCollapseTransitionEnd:function(e){s(e),d(!e)}},P.createElement("div",{className:$},o)))};var K=(0,P.createContext)(null);function Y(e){var t=e.children;return P.createElement(K.Provider,{value:(0,P.useState)(null)},t)}function J(){var e=(0,P.useContext)(K);if(null===e)throw new Error("MobileSecondaryMenuProvider was not used correctly, context value is null");return e}function Q(){var e=J()[0];if(e){var t=e.component;return function(n){return P.createElement(t,Object.assign({},e.props,n))}}return function(){}}function ee(e){var t,n=e.component,r=e.props,o=J()[1],a=(t=r,(0,P.useMemo)((function(){return t}),[].concat(Object.keys(t),Object.values(t))));return(0,P.useEffect)((function(){o({component:n,props:a})}),[o,n,a]),(0,P.useEffect)((function(){return function(){return o(null)}}),[o]),null}var te=function(e){return"docs-preferred-version-"+e},ne={save:function(e,t,n){l(te(e),{persistence:t}).set(n)},read:function(e,t){return l(te(e),{persistence:t}).get()},clear:function(e,t){l(te(e),{persistence:t}).del()}};function re(e){var t=e.pluginIds,n=e.versionPersistence,r=e.allDocsData;var o={};return t.forEach((function(e){o[e]=function(e){var t=ne.read(e,n);return r[e].versions.some((function(e){return e.name===t}))?{preferredVersionName:t}:(ne.clear(e,n),{preferredVersionName:null})}(e)})),o}function oe(){var e=(0,h.useAllDocsData)(),t=o().docs.versionPersistence,n=(0,P.useMemo)((function(){return Object.keys(e)}),[e]),r=(0,P.useState)((function(){return function(e){var t={};return e.forEach((function(e){t[e]={preferredVersionName:null}})),t}(n)})),a=r[0],i=r[1];return(0,P.useEffect)((function(){i(re({allDocsData:e,versionPersistence:t,pluginIds:n}))}),[e,t,n]),[a,(0,P.useMemo)((function(){return{savePreferredVersion:function(e,n){ne.save(e,t,n),i((function(t){var r;return Object.assign({},t,((r={})[e]={preferredVersionName:n},r))}))}}}),[i])]}var ae=(0,P.createContext)(null);function ie(e){var t=e.children;return m?P.createElement(ue,null,t):P.createElement(P.Fragment,null,t)}function ue(e){var t=e.children,n=oe();return P.createElement(ae.Provider,{value:n},t)}function ce(){var e=(0,P.useContext)(ae);if(!e)throw new Error('Can\'t find docs preferred context, maybe you forgot to use the "DocsPreferredVersionContextProvider"?');return e}function le(e){void 0===e&&(e="default");var t=(0,h.useDocsData)(e),n=ce(),r=n[0],o=n[1],a=r[e].preferredVersionName;return{preferredVersion:a?t.versions.find((function(e){return e.name===a})):null,savePreferredVersionName:(0,P.useCallback)((function(t){o.savePreferredVersion(e,t)}),[o])}}function se(){var e=(0,h.useAllDocsData)(),t=ce()[0];var n=Object.keys(e),r={};return n.forEach((function(n){r[n]=function(n){var r=e[n],o=t[n].preferredVersionName;return o?r.versions.find((function(e){return e.name===o})):null}(n)})),r}var fe={page:{blogListPage:"blog-list-page",blogPostPage:"blog-post-page",blogTagsListPage:"blog-tags-list-page",blogTagsPostPage:"blog-tags-post-page",docPage:"doc-page",mdxPage:"mdx-page"},wrapper:{main:"main-wrapper",blogPages:"blog-wrapper",docPages:"docs-wrapper",mdxPages:"mdx-wrapper"}},pe=l("docusaurus.announcement.dismiss"),de=l("docusaurus.announcement.id"),ve=function(){return"true"===pe.get()},ge=function(e){return pe.set(String(e))},ye=(0,P.createContext)(null),he=function(e){var t=e.children,n=function(){var e=o().announcementBar,t=(0,r.Z)().isClient,n=(0,P.useState)((function(){return!!t&&ve()})),a=n[0],i=n[1];(0,P.useEffect)((function(){i(ve())}),[]);var u=(0,P.useCallback)((function(){ge(!0),i(!0)}),[]);return(0,P.useEffect)((function(){if(e){var t=e.id,n=de.get();"annoucement-bar"===n&&(n="announcement-bar");var r=t!==n;de.set(t),r&&ge(!1),!r&&ve()||i(!1)}}),[]),(0,P.useMemo)((function(){return{isClosed:a,close:u}}),[a])}();return P.createElement(ye.Provider,{value:n},t)},me=function(){var e=(0,P.useContext)(ye);if(!e)throw new Error("useAnnouncementBar(): AnnouncementBar not found in React context: make sure to use the AnnouncementBarProvider on top of the tree");return e};function be(){var e=(0,r.Z)().siteConfig.baseUrl;return(0,f.TH)().pathname.replace(e,"/")}},6010:function(e,t,n){"use strict";function r(e){var t,n,o="";if("string"==typeof e||"number"==typeof e)o+=e;else if("object"==typeof e)if(Array.isArray(e))for(t=0;t<e.length;t++)e[t]&&(n=r(e[t]))&&(o&&(o+=" "),o+=n);else for(t in e)e[t]&&(o&&(o+=" "),o+=t);return o}function o(){for(var e,t,n=0,o="";n<arguments.length;)(e=arguments[n++])&&(t=r(e))&&(o&&(o+=" "),o+=t);return o}n.d(t,{Z:function(){return o}})},7594:function(e,t){function n(e){let t,n=[];for(let r of e.split(",").map((e=>e.trim())))if(/^-?\d+$/.test(r))n.push(parseInt(r,10));else if(t=r.match(/^(-?\d+)(-|\.\.\.?|\u2025|\u2026|\u22EF)(-?\d+)$/)){let[e,r,o,a]=t;if(r&&a){r=parseInt(r),a=parseInt(a);const e=r<a?1:-1;"-"!==o&&".."!==o&&"\u2025"!==o||(a+=e);for(let t=r;t!==a;t+=e)n.push(t)}}return n}t.default=n,e.exports=n},655:function(e,t,n){"use strict";n.r(t),n.d(t,{__extends:function(){return o},__assign:function(){return a},__rest:function(){return i},__decorate:function(){return u},__param:function(){return c},__metadata:function(){return l},__awaiter:function(){return s},__generator:function(){return f},__createBinding:function(){return p},__exportStar:function(){return d},__values:function(){return v},__read:function(){return g},__spread:function(){return y},__spreadArrays:function(){return h},__spreadArray:function(){return m},__await:function(){return b},__asyncGenerator:function(){return w},__asyncDelegator:function(){return P},__asyncValues:function(){return k},__makeTemplateObject:function(){return O},__importStar:function(){return D},__importDefault:function(){return j},__classPrivateFieldGet:function(){return _},__classPrivateFieldSet:function(){return x}});var r=function(e,t){return(r=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(e,t){e.__proto__=t}||function(e,t){for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(e[n]=t[n])})(e,t)};function o(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Class extends value "+String(t)+" is not a constructor or null");function n(){this.constructor=e}r(e,t),e.prototype=null===t?Object.create(t):(n.prototype=t.prototype,new n)}var a=function(){return(a=Object.assign||function(e){for(var t,n=1,r=arguments.length;n<r;n++)for(var o in t=arguments[n])Object.prototype.hasOwnProperty.call(t,o)&&(e[o]=t[o]);return e}).apply(this,arguments)};function i(e,t){var n={};for(var r in e)Object.prototype.hasOwnProperty.call(e,r)&&t.indexOf(r)<0&&(n[r]=e[r]);if(null!=e&&"function"==typeof Object.getOwnPropertySymbols){var o=0;for(r=Object.getOwnPropertySymbols(e);o<r.length;o++)t.indexOf(r[o])<0&&Object.prototype.propertyIsEnumerable.call(e,r[o])&&(n[r[o]]=e[r[o]])}return n}function u(e,t,n,r){var o,a=arguments.length,i=a<3?t:null===r?r=Object.getOwnPropertyDescriptor(t,n):r;if("object"==typeof Reflect&&"function"==typeof Reflect.decorate)i=Reflect.decorate(e,t,n,r);else for(var u=e.length-1;u>=0;u--)(o=e[u])&&(i=(a<3?o(i):a>3?o(t,n,i):o(t,n))||i);return a>3&&i&&Object.defineProperty(t,n,i),i}function c(e,t){return function(n,r){t(n,r,e)}}function l(e,t){if("object"==typeof Reflect&&"function"==typeof Reflect.metadata)return Reflect.metadata(e,t)}function s(e,t,n,r){return new(n||(n=Promise))((function(o,a){function i(e){try{c(r.next(e))}catch(t){a(t)}}function u(e){try{c(r.throw(e))}catch(t){a(t)}}function c(e){var t;e.done?o(e.value):(t=e.value,t instanceof n?t:new n((function(e){e(t)}))).then(i,u)}c((r=r.apply(e,t||[])).next())}))}function f(e,t){var n,r,o,a,i={label:0,sent:function(){if(1&o[0])throw o[1];return o[1]},trys:[],ops:[]};return a={next:u(0),throw:u(1),return:u(2)},"function"==typeof Symbol&&(a[Symbol.iterator]=function(){return this}),a;function u(a){return function(u){return function(a){if(n)throw new TypeError("Generator is already executing.");for(;i;)try{if(n=1,r&&(o=2&a[0]?r.return:a[0]?r.throw||((o=r.return)&&o.call(r),0):r.next)&&!(o=o.call(r,a[1])).done)return o;switch(r=0,o&&(a=[2&a[0],o.value]),a[0]){case 0:case 1:o=a;break;case 4:return i.label++,{value:a[1],done:!1};case 5:i.label++,r=a[1],a=[0];continue;case 7:a=i.ops.pop(),i.trys.pop();continue;default:if(!(o=i.trys,(o=o.length>0&&o[o.length-1])||6!==a[0]&&2!==a[0])){i=0;continue}if(3===a[0]&&(!o||a[1]>o[0]&&a[1]<o[3])){i.label=a[1];break}if(6===a[0]&&i.label<o[1]){i.label=o[1],o=a;break}if(o&&i.label<o[2]){i.label=o[2],i.ops.push(a);break}o[2]&&i.ops.pop(),i.trys.pop();continue}a=t.call(e,i)}catch(u){a=[6,u],r=0}finally{n=o=0}if(5&a[0])throw a[1];return{value:a[0]?a[1]:void 0,done:!0}}([a,u])}}}var p=Object.create?function(e,t,n,r){void 0===r&&(r=n),Object.defineProperty(e,r,{enumerable:!0,get:function(){return t[n]}})}:function(e,t,n,r){void 0===r&&(r=n),e[r]=t[n]};function d(e,t){for(var n in e)"default"===n||Object.prototype.hasOwnProperty.call(t,n)||p(t,e,n)}function v(e){var t="function"==typeof Symbol&&Symbol.iterator,n=t&&e[t],r=0;if(n)return n.call(e);if(e&&"number"==typeof e.length)return{next:function(){return e&&r>=e.length&&(e=void 0),{value:e&&e[r++],done:!e}}};throw new TypeError(t?"Object is not iterable.":"Symbol.iterator is not defined.")}function g(e,t){var n="function"==typeof Symbol&&e[Symbol.iterator];if(!n)return e;var r,o,a=n.call(e),i=[];try{for(;(void 0===t||t-- >0)&&!(r=a.next()).done;)i.push(r.value)}catch(u){o={error:u}}finally{try{r&&!r.done&&(n=a.return)&&n.call(a)}finally{if(o)throw o.error}}return i}function y(){for(var e=[],t=0;t<arguments.length;t++)e=e.concat(g(arguments[t]));return e}function h(){for(var e=0,t=0,n=arguments.length;t<n;t++)e+=arguments[t].length;var r=Array(e),o=0;for(t=0;t<n;t++)for(var a=arguments[t],i=0,u=a.length;i<u;i++,o++)r[o]=a[i];return r}function m(e,t,n){if(n||2===arguments.length)for(var r,o=0,a=t.length;o<a;o++)!r&&o in t||(r||(r=Array.prototype.slice.call(t,0,o)),r[o]=t[o]);return e.concat(r||Array.prototype.slice.call(t))}function b(e){return this instanceof b?(this.v=e,this):new b(e)}function w(e,t,n){if(!Symbol.asyncIterator)throw new TypeError("Symbol.asyncIterator is not defined.");var r,o=n.apply(e,t||[]),a=[];return r={},i("next"),i("throw"),i("return"),r[Symbol.asyncIterator]=function(){return this},r;function i(e){o[e]&&(r[e]=function(t){return new Promise((function(n,r){a.push([e,t,n,r])>1||u(e,t)}))})}function u(e,t){try{(n=o[e](t)).value instanceof b?Promise.resolve(n.value.v).then(c,l):s(a[0][2],n)}catch(r){s(a[0][3],r)}var n}function c(e){u("next",e)}function l(e){u("throw",e)}function s(e,t){e(t),a.shift(),a.length&&u(a[0][0],a[0][1])}}function P(e){var t,n;return t={},r("next"),r("throw",(function(e){throw e})),r("return"),t[Symbol.iterator]=function(){return this},t;function r(r,o){t[r]=e[r]?function(t){return(n=!n)?{value:b(e[r](t)),done:"return"===r}:o?o(t):t}:o}}function k(e){if(!Symbol.asyncIterator)throw new TypeError("Symbol.asyncIterator is not defined.");var t,n=e[Symbol.asyncIterator];return n?n.call(e):(e=v(e),t={},r("next"),r("throw"),r("return"),t[Symbol.asyncIterator]=function(){return this},t);function r(n){t[n]=e[n]&&function(t){return new Promise((function(r,o){(function(e,t,n,r){Promise.resolve(r).then((function(t){e({value:t,done:n})}),t)})(r,o,(t=e[n](t)).done,t.value)}))}}}function O(e,t){return Object.defineProperty?Object.defineProperty(e,"raw",{value:t}):e.raw=t,e}var E=Object.create?function(e,t){Object.defineProperty(e,"default",{enumerable:!0,value:t})}:function(e,t){e.default=t};function D(e){if(e&&e.__esModule)return e;var t={};if(null!=e)for(var n in e)"default"!==n&&Object.prototype.hasOwnProperty.call(e,n)&&p(t,e,n);return E(t,e),t}function j(e){return e&&e.__esModule?e:{default:e}}function _(e,t,n,r){if("a"===n&&!r)throw new TypeError("Private accessor was defined without a getter");if("function"==typeof t?e!==t||!r:!t.has(e))throw new TypeError("Cannot read private member from an object whose class did not declare it");return"m"===n?r:"a"===n?r.call(e):r?r.value:t.get(e)}function x(e,t,n,r,o){if("m"===r)throw new TypeError("Private method is not writable");if("a"===r&&!o)throw new TypeError("Private accessor was defined without a setter");if("function"==typeof t?e!==t||!o:!t.has(e))throw new TypeError("Cannot write private member to an object whose class did not declare it");return"a"===r?o.call(e,n):o?o.value=n:t.set(e,n),n}}}]);