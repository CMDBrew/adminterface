"use strict";(self.webpackChunkwebsite=self.webpackChunkwebsite||[]).push([[85],{6159:function(e,n,t){t.d(n,{N:function(){return d},Z:function(){return f}});var r=t(3366),a=t(7462),l=t(7294),i=t(6010),c=t(4973),o=t(941),u="anchorWithStickyNavbar_31ik",s="anchorWithHideOnScrollNavbar_3R7-",m=["id"],d=function(e){var n=Object.assign({},e);return l.createElement("header",null,l.createElement("h1",(0,a.Z)({},n,{id:void 0}),n.children))},f=function(e){return"h1"===e?d:(n=e,function(e){var t,a=e.id,d=(0,r.Z)(e,m),f=(0,o.LU)().navbar.hideOnScroll;return a?l.createElement(n,d,l.createElement("a",{"aria-hidden":"true",tabIndex:-1,className:(0,i.Z)("anchor","anchor__"+n,(t={},t[s]=f,t[u]=!f,t)),id:a}),d.children,l.createElement("a",{className:"hash-link",href:"#"+a,title:(0,c.I)({id:"theme.common.headingLinkTitle",message:"Direct link to heading",description:"Title for link to heading"})},"#")):l.createElement(n,d)});var n}},2238:function(e,n,t){t.d(n,{Z:function(){return v}});var r=t(7462),a=t(3366),l=t(7294),i=t(9105),c=t(6742),o=t(9354),u=t(6159),s=t(6010),m=t(941),d="details_1VDD";function f(e){var n=Object.assign({},e);return l.createElement(m.PO,(0,r.Z)({},n,{className:(0,s.Z)("alert alert--info",d,n.className)}))}var h=["mdxType","originalType"];var v={head:function(e){var n=l.Children.map(e.children,(function(e){return function(e){var n,t;if(null!=e&&null!=(n=e.props)&&n.mdxType&&null!=e&&null!=(t=e.props)&&t.originalType){var r=e.props,i=(r.mdxType,r.originalType,(0,a.Z)(r,h));return l.createElement(e.props.originalType,i)}return e}(e)}));return l.createElement(i.Z,e,n)},code:function(e){var n=e.children;return(0,l.isValidElement)(n)?n:n.includes("\n")?l.createElement(o.Z,e):l.createElement("code",e)},a:function(e){return l.createElement(c.Z,e)},pre:function(e){var n,t=e.children;return(0,l.isValidElement)(t)&&(0,l.isValidElement)(null==t||null==(n=t.props)?void 0:n.children)?t.props.children:l.createElement(o.Z,(0,l.isValidElement)(t)?null==t?void 0:t.props:Object.assign({},e))},details:function(e){var n=l.Children.toArray(e.children),t=n.find((function(e){var n;return"summary"===(null==e||null==(n=e.props)?void 0:n.mdxType)})),a=l.createElement(l.Fragment,null,n.filter((function(e){return e!==t})));return l.createElement(f,(0,r.Z)({},e,{summary:t}),a)},h1:(0,u.Z)("h1"),h2:(0,u.Z)("h2"),h3:(0,u.Z)("h3"),h4:(0,u.Z)("h4"),h5:(0,u.Z)("h5"),h6:(0,u.Z)("h6")}},7979:function(e,n,t){t.r(n),t.d(n,{default:function(){return m}});var r=t(7294),a=t(6010),l=t(3516),i=t(3905),c=t(2238),o=t(571),u=t(941),s="mdxPageWrapper_3qD3";var m=function(e){var n=e.content,t=n.frontMatter,m=n.metadata,d=t.title,f=t.description,h=t.wrapperClassName,v=t.hide_table_of_contents,p=m.permalink;return r.createElement(l.Z,{title:d,description:f,permalink:p,wrapperClassName:null!=h?h:u.kM.wrapper.mdxPages,pageClassName:u.kM.page.mdxPage},r.createElement("main",{className:"container container--fluid margin-vert--lg"},r.createElement("div",{className:(0,a.Z)("row",s)},r.createElement("div",{className:(0,a.Z)("col",!v&&"col--8")},r.createElement(i.Zo,{components:c.Z},r.createElement(n,null))),!v&&n.toc&&r.createElement("div",{className:"col col--2"},r.createElement(o.Z,{toc:n.toc})))))}},571:function(e,n,t){t.d(n,{r:function(){return f},Z:function(){return h}});var r=t(7294),a=t(6010),l=t(941);function i(e){var n=e.getBoundingClientRect();return n.top===n.bottom?i(e.parentNode):n}function c(e){var n,t=e.anchorTopOffset,r=Array.from(document.querySelectorAll(".anchor.anchor__h2, .anchor.anchor__h3")),a=r.find((function(e){return i(e).top>=t}));return a?function(e){return e.top>0&&e.bottom<window.innerHeight/2}(i(a))?a:null!=(n=r[r.indexOf(a)-1])?n:null:r[r.length-1]}function o(){var e=(0,r.useRef)(0),n=(0,l.LU)().navbar.hideOnScroll;return(0,r.useEffect)((function(){e.current=n?0:document.querySelector(".navbar").clientHeight}),[n]),e}var u=function(e){var n=(0,r.useRef)(void 0),t=o();(0,r.useEffect)((function(){var r=e.linkClassName,a=e.linkActiveClassName;function l(){var e=function(e){return Array.from(document.getElementsByClassName(e))}(r),l=c({anchorTopOffset:t.current}),i=e.find((function(e){return l&&l.id===function(e){return decodeURIComponent(e.href.substring(e.href.indexOf("#")+1))}(e)}));e.forEach((function(e){!function(e,t){if(t){var r;n.current&&n.current!==e&&(null==(r=n.current)||r.classList.remove(a)),e.classList.add(a),n.current=e}else e.classList.remove(a)}(e,e===i)}))}return document.addEventListener("scroll",l),document.addEventListener("resize",l),l(),function(){document.removeEventListener("scroll",l),document.removeEventListener("resize",l)}}),[e,t])},s="tableOfContents_35-E",m="table-of-contents__link",d={linkClassName:m,linkActiveClassName:"table-of-contents__link--active"};function f(e){var n=e.toc,t=e.isChild;return n.length?r.createElement("ul",{className:t?"":"table-of-contents table-of-contents__left-border"},n.map((function(e){return r.createElement("li",{key:e.id},r.createElement("a",{href:"#"+e.id,className:m,dangerouslySetInnerHTML:{__html:e.value}}),r.createElement(f,{isChild:!0,toc:e.children}))}))):null}var h=function(e){var n=e.toc;return u(d),r.createElement("div",{className:(0,a.Z)(s,"thin-scrollbar")},r.createElement(f,{toc:n}))}}}]);