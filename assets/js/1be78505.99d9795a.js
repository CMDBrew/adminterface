"use strict";(self.webpackChunkwebsite=self.webpackChunkwebsite||[]).push([[514,608],{8704:function(e,t,n){n.r(t),n.d(t,{default:function(){return ee}});var a=n(7294),r=n(3905),l=n(2263),i=n(6291),o=n(2273),c=n(6010),s=n(3018),d=n(3783),u=n(7898),m=n(5537),h=n(7462),p=function(e){return a.createElement("svg",(0,h.Z)({width:"20",height:"20","aria-hidden":"true"},e),a.createElement("g",{fill:"#7a7a7a"},a.createElement("path",{d:"M9.992 10.023c0 .2-.062.399-.172.547l-4.996 7.492a.982.982 0 01-.828.454H1c-.55 0-1-.453-1-1 0-.2.059-.403.168-.551l4.629-6.942L.168 3.078A.939.939 0 010 2.528c0-.548.45-.997 1-.997h2.996c.352 0 .649.18.828.45L9.82 9.472c.11.148.172.347.172.55zm0 0"}),a.createElement("path",{d:"M19.98 10.023c0 .2-.058.399-.168.547l-4.996 7.492a.987.987 0 01-.828.454h-3c-.547 0-.996-.453-.996-1 0-.2.059-.403.168-.551l4.625-6.942-4.625-6.945a.939.939 0 01-.168-.55 1 1 0 01.996-.997h3c.348 0 .649.18.828.45l4.996 7.492c.11.148.168.347.168.55zm0 0"})))},f=n(4973),b=n(3366),v=n(6742),E=n(3919),Z=n(8617),g="menuLinkText_1J2g",k=["items"],C=["item"],_=["item","onItemClick","activePath"],N=["item","onItemClick","activePath"],S=function e(t,n){return"link"===t.type?(0,s.Mg)(t.href,n):"category"===t.type&&t.items.some((function(t){return e(t,n)}))},T=(0,a.memo)((function(e){var t=e.items,n=(0,b.Z)(e,k);return a.createElement(a.Fragment,null,t.map((function(e,t){return a.createElement(I,(0,h.Z)({key:t,item:e},n))})))}));function I(e){var t=e.item,n=(0,b.Z)(e,C);switch(t.type){case"category":return 0===t.items.length?null:a.createElement(w,(0,h.Z)({item:t},n));case"link":default:return a.createElement(y,(0,h.Z)({item:t},n))}}function w(e){var t,n=e.item,r=e.onItemClick,l=e.activePath,i=(0,b.Z)(e,_),o=n.items,d=n.label,u=n.collapsible,m=S(n,l),p=(0,s.uR)({initialState:function(){return!!u&&(!m&&n.collapsed)}}),f=p.collapsed,v=p.setCollapsed,E=p.toggleCollapsed;return function(e){var t=e.isActive,n=e.collapsed,r=e.setCollapsed,l=(0,s.D9)(t);(0,a.useEffect)((function(){t&&!l&&n&&r(!1)}),[t,l,n])}({isActive:m,collapsed:f,setCollapsed:v}),a.createElement("li",{className:(0,c.Z)("menu__list-item",{"menu__list-item--collapsed":f})},a.createElement("a",(0,h.Z)({className:(0,c.Z)("menu__link",(t={"menu__link--sublist":u,"menu__link--active":u&&m},t[g]=!u,t)),onClick:u?function(e){e.preventDefault(),E()}:void 0,href:u?"#":void 0},i),d),a.createElement(s.zF,{lazy:!0,as:"ul",className:"menu__list",collapsed:f},a.createElement(T,{items:o,tabIndex:f?-1:0,onItemClick:r,activePath:l})))}function y(e){var t=e.item,n=e.onItemClick,r=e.activePath,l=(0,b.Z)(e,N),i=t.href,o=t.label,s=S(t,r);return a.createElement("li",{className:"menu__list-item",key:o},a.createElement(v.Z,(0,h.Z)({className:(0,c.Z)("menu__link",{"menu__link--active":s}),to:i},(0,E.Z)(i)&&{isNavLink:!0,exact:!0,onClick:n},l),(0,E.Z)(i)?o:a.createElement("span",null,o,a.createElement(Z.Z,null))))}var M="sidebar_15mo",x="sidebarWithHideableNavbar_267A",A="sidebarHidden_2kNb",L="sidebarLogo_3h0W",P="menu_Bmed",B="menuWithAnnouncementBar_2WvA",F="collapseSidebarButton_1CGd",H="collapseSidebarButtonIcon_3E-R";function D(e){var t=e.onClick;return a.createElement("button",{type:"button",title:(0,f.I)({id:"theme.docs.sidebar.collapseButtonTitle",message:"Collapse sidebar",description:"The title attribute for collapse button of doc sidebar"}),"aria-label":(0,f.I)({id:"theme.docs.sidebar.collapseButtonAriaLabel",message:"Collapse sidebar",description:"The title attribute for collapse button of doc sidebar"}),className:(0,c.Z)("button button--secondary button--outline",F),onClick:t},a.createElement(p,{className:H}))}function W(e){var t,n,r=e.path,l=e.sidebar,i=e.onCollapse,o=e.isHidden,d=function(){var e=(0,s.nT)().isClosed,t=(0,a.useState)(!e),n=t[0],r=t[1];return(0,u.Z)((function(t){var n=t.scrollY;e||r(0===n)})),n}(),h=(0,s.LU)(),p=h.navbar.hideOnScroll,f=h.hideableSidebar,b=(0,s.nT)().isClosed;return a.createElement("div",{className:(0,c.Z)(M,(t={},t[x]=p,t[A]=o,t))},p&&a.createElement(m.Z,{tabIndex:-1,className:L}),a.createElement("nav",{className:(0,c.Z)("menu thin-scrollbar",P,(n={},n[B]=!b&&d,n))},a.createElement("ul",{className:"menu__list"},a.createElement(T,{items:l,activePath:r}))),f&&a.createElement(D,{onClick:i}))}var R=function(e){var t=e.toggleSidebar,n=e.sidebar,r=e.path;return a.createElement("ul",{className:"menu__list"},a.createElement(T,{items:n,activePath:r,onItemClick:function(){return t()}}))};function O(e){return a.createElement(s.Cv,{component:R,props:e})}var z=a.memo(W),V=a.memo(O);function Y(e){var t=(0,d.Z)(),n="desktop"===t||"ssr"===t,r="mobile"===t;return a.createElement(a.Fragment,null,n&&a.createElement(z,e),r&&a.createElement(V,e))}var j=n(2238),J=n(4608),U="backToTopButton_35hR",K="backToTopButtonShow_18ls";function q(){var e=(0,a.useRef)(null);return{smoothScrollTop:function(){var t;e.current=(t=null,function e(){var n=document.documentElement.scrollTop;n>0&&(t=requestAnimationFrame(e),window.scrollTo(0,Math.floor(.85*n)))}(),function(){t&&cancelAnimationFrame(t)})},cancelScrollToTop:function(){return null==e.current?void 0:e.current()}}}var G=function(){var e,t=q(),n=t.smoothScrollTop,r=t.cancelScrollToTop,l=(0,a.useState)(!1),i=l[0],o=l[1];return(0,u.Z)((function(e,t){var n=e.scrollY;if(t){var a=n<t.scrollY;if(a||r(),n<300)o(!1);else if(a){var l=document.documentElement.scrollHeight;n+window.innerHeight<l&&o(!0)}else o(!1)}}),[]),a.createElement("button",{className:(0,c.Z)("clean-btn",U,(e={},e[K]=i,e)),type:"button",title:"Scroll to top",onClick:function(){return n()}},a.createElement("svg",{viewBox:"0 0 24 24",width:"28"},a.createElement("path",{d:"M7.41 15.41L12 10.83l4.59 4.58L18 14l-6-6-6 6z",fill:"currentColor"})))},Q=n(5977),X={docPage:"docPage_31aa",docMainContainer:"docMainContainer_3ufF",docSidebarContainer:"docSidebarContainer_3Kbt",docMainContainerEnhanced:"docMainContainerEnhanced_3NYZ",docSidebarContainerHidden:"docSidebarContainerHidden_3pA8",collapsedDocSidebar:"collapsedDocSidebar_2JMH",expandSidebarButtonIcon:"expandSidebarButtonIcon_1naQ",docItemWrapperEnhanced:"docItemWrapperEnhanced_2vyJ"};function $(e){var t,n,i,d=e.currentDocRoute,u=e.versionMetadata,m=e.children,h=(0,l.Z)().isClient,b=u.pluginId,v=u.version,E=d.sidebar,Z=E?u.docsSidebars[E]:void 0,g=(0,a.useState)(!1),k=g[0],C=g[1],_=(0,a.useState)(!1),N=_[0],S=_[1],T=(0,a.useCallback)((function(){N&&S(!1),C(!k)}),[N]);return a.createElement(o.Z,{key:h,wrapperClassName:s.kM.wrapper.docPages,pageClassName:s.kM.page.docPage,searchMetadatas:{version:v,tag:(0,s.os)(b,v)}},a.createElement("div",{className:X.docPage},a.createElement(G,null),Z&&a.createElement("aside",{className:(0,c.Z)(X.docSidebarContainer,(t={},t[X.docSidebarContainerHidden]=k,t)),onTransitionEnd:function(e){e.currentTarget.classList.contains(X.docSidebarContainer)&&k&&S(!0)}},a.createElement(Y,{key:E,sidebar:Z,path:d.path,onCollapse:T,isHidden:N}),N&&a.createElement("div",{className:X.collapsedDocSidebar,title:(0,f.I)({id:"theme.docs.sidebar.expandButtonTitle",message:"Expand sidebar",description:"The ARIA label and title attribute for expand button of doc sidebar"}),"aria-label":(0,f.I)({id:"theme.docs.sidebar.expandButtonAriaLabel",message:"Expand sidebar",description:"The ARIA label and title attribute for expand button of doc sidebar"}),tabIndex:0,role:"button",onKeyDown:T,onClick:T},a.createElement(p,{className:X.expandSidebarButtonIcon}))),a.createElement("main",{className:(0,c.Z)(X.docMainContainer,(n={},n[X.docMainContainerEnhanced]=k||!Z,n))},a.createElement("div",{className:(0,c.Z)("container padding-top--md padding-bottom--lg",X.docItemWrapper,(i={},i[X.docItemWrapperEnhanced]=k,i))},a.createElement(r.Zo,{components:j.Z},m)))))}var ee=function(e){var t=e.route.routes,n=e.versionMetadata,r=e.location,l=t.find((function(e){return(0,Q.LX)(r.pathname,e)}));return l?a.createElement($,{currentDocRoute:l,versionMetadata:n},(0,i.Z)(t,{versionMetadata:n})):a.createElement(J.default,e)}},6159:function(e,t,n){n.d(t,{N:function(){return m},Z:function(){return h}});var a=n(3366),r=n(7462),l=n(7294),i=n(6010),o=n(4973),c=n(3018),s="enhancedAnchor_2LWZ",d="h1Heading_27L5",u=["id"],m=function(e){var t=Object.assign({},e);return l.createElement("header",null,l.createElement("h1",(0,r.Z)({},t,{id:void 0,className:d}),t.children))},h=function(e){return"h1"===e?m:(t=e,function(e){var n,r=e.id,d=(0,a.Z)(e,u),m=(0,c.LU)().navbar.hideOnScroll;return r?l.createElement(t,d,l.createElement("a",{"aria-hidden":"true",tabIndex:-1,className:(0,i.Z)("anchor",(n={},n[s]=!m,n)),id:r}),d.children,l.createElement("a",{className:"hash-link",href:"#"+r,title:(0,o.I)({id:"theme.common.headingLinkTitle",message:"Direct link to heading",description:"Title for link to heading"})},"#")):l.createElement(t,d)});var t}},2238:function(e,t,n){n.d(t,{Z:function(){return m}});var a=n(7462),r=n(7294),l=n(6742),i=n(6848),o=n(6159),c=n(6010),s=n(3018),d="details_1VDD";function u(e){var t=Object.assign({},e);return r.createElement(s.PO,(0,a.Z)({},t,{className:(0,c.Z)("alert alert--info",d,t.className)}))}var m={code:function(e){var t=e.children;return(0,r.isValidElement)(t)?t:t.includes("\n")?r.createElement(i.Z,e):r.createElement("code",e)},a:function(e){return r.createElement(l.Z,e)},pre:function(e){var t,n=e.children;return(0,r.isValidElement)(null==n||null==(t=n.props)?void 0:t.children)?null==n?void 0:n.props.children:r.createElement(i.Z,(0,r.isValidElement)(n)?null==n?void 0:n.props:Object.assign({},e))},details:function(e){var t=r.Children.toArray(e.children),n=t.find((function(e){var t;return"summary"===(null==e||null==(t=e.props)?void 0:t.mdxType)})),l=r.createElement(r.Fragment,null,t.filter((function(e){return e!==n})));return r.createElement(u,(0,a.Z)({},e,{summary:n}),l)},h1:(0,o.Z)("h1"),h2:(0,o.Z)("h2"),h3:(0,o.Z)("h3"),h4:(0,o.Z)("h4"),h5:(0,o.Z)("h5"),h6:(0,o.Z)("h6")}},4608:function(e,t,n){n.r(t);var a=n(7294),r=n(2273),l=n(4973);t.default=function(){return a.createElement(r.Z,{title:(0,l.I)({id:"theme.NotFound.title",message:"Page Not Found"})},a.createElement("main",{className:"container margin-vert--xl"},a.createElement("div",{className:"row"},a.createElement("div",{className:"col col--6 col--offset-3"},a.createElement("h1",{className:"hero__title"},a.createElement(l.Z,{id:"theme.NotFound.title",description:"The title of the 404 page"},"Page Not Found")),a.createElement("p",null,a.createElement(l.Z,{id:"theme.NotFound.p1",description:"The first paragraph of the 404 page"},"We could not find what you were looking for.")),a.createElement("p",null,a.createElement(l.Z,{id:"theme.NotFound.p2",description:"The 2nd paragraph of the 404 page"},"Please contact the owner of the site that linked you to the original URL and let them know their link is broken."))))))}}}]);