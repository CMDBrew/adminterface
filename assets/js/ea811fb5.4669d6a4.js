"use strict";(self.webpackChunkwebsite=self.webpackChunkwebsite||[]).push([[101],{8215:function(e,t,n){var a=n(7294);t.Z=function(e){var t=e.children,n=e.hidden,i=e.className;return a.createElement("div",{role:"tabpanel",hidden:n,className:i},t)}},5064:function(e,t,n){n.d(t,{Z:function(){return u}});var a=n(7294),i=n(9443);var r=function(){var e=(0,a.useContext)(i.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},o=n(6010),l="tabItem_1uMI",s="tabItemActive_2DSg";var c=37,d=39;var u=function(e){var t=e.lazy,n=e.block,i=e.defaultValue,u=e.values,m=e.groupId,f=e.className,p=r(),g=p.tabGroupChoices,v=p.setTabGroupChoices,k=(0,a.useState)(i),h=k[0],b=k[1],y=a.Children.toArray(e.children),C=[];if(null!=m){var N=g[m];null!=N&&N!==h&&u.some((function(e){return e.value===N}))&&b(N)}var _=function(e){var t=e.currentTarget,n=C.indexOf(t),a=u[n].value;b(a),null!=m&&(v(m,a),setTimeout((function(){var e,n,a,i,r,o,l,c;(e=t.getBoundingClientRect(),n=e.top,a=e.left,i=e.bottom,r=e.right,o=window,l=o.innerHeight,c=o.innerWidth,n>=0&&r<=c&&i<=l&&a>=0)||(t.scrollIntoView({block:"center",behavior:"smooth"}),t.classList.add(s),setTimeout((function(){return t.classList.remove(s)}),2e3))}),150))},w=function(e){var t,n;switch(e.keyCode){case d:var a=C.indexOf(e.target)+1;n=C[a]||C[0];break;case c:var i=C.indexOf(e.target)-1;n=C[i]||C[C.length-1]}null==(t=n)||t.focus()};return a.createElement("div",{className:"tabs-container"},a.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,o.Z)("tabs",{"tabs--block":n},f)},u.map((function(e){var t=e.value,n=e.label;return a.createElement("li",{role:"tab",tabIndex:h===t?0:-1,"aria-selected":h===t,className:(0,o.Z)("tabs__item",l,{"tabs__item--active":h===t}),key:t,ref:function(e){return C.push(e)},onKeyDown:w,onFocus:_,onClick:_},n)}))),t?(0,a.cloneElement)(y.filter((function(e){return e.props.value===h}))[0],{className:"margin-vert--md"}):a.createElement("div",{className:"margin-vert--md"},y.map((function(e,t){return(0,a.cloneElement)(e,{key:t,hidden:e.props.value!==h})}))))}},4471:function(e,t,n){n.r(t),n.d(t,{frontMatter:function(){return c},contentTitle:function(){return d},metadata:function(){return u},toc:function(){return m},default:function(){return p}});var a=n(7462),i=n(3366),r=(n(7294),n(3905)),o=n(5064),l=n(8215),s=(n(6848),["components"]),c={sidebar_position:4,description:"Adminterface Guide for Confirm Dialog Configs, Override the Defaults, and Javascript Events."},d="Confirm Dialog",u={unversionedId:"guides/confirm-dialog",id:"guides/confirm-dialog",isDocsHomePage:!1,title:"Confirm Dialog",description:"Adminterface Guide for Confirm Dialog Configs, Override the Defaults, and Javascript Events.",source:"@site/docs/guides/confirm-dialog.mdx",sourceDirName:"guides",slug:"/guides/confirm-dialog",permalink:"/adminterface/docs/guides/confirm-dialog",editUrl:"https://github.com/CMDBrew/adminterface/edit/main/website/docs/guides/confirm-dialog.mdx",tags:[],version:"current",sidebarPosition:4,frontMatter:{sidebar_position:4,description:"Adminterface Guide for Confirm Dialog Configs, Override the Defaults, and Javascript Events."},sidebar:"tutorialSidebar",previous:{title:"Batch Actions",permalink:"/adminterface/docs/guides/batch-actions"},next:{title:"Terms of Service",permalink:"/adminterface/docs/terms"}},m=[{value:"Configurations",id:"configurations",children:[]},{value:"Override the Defaults",id:"override-the-defaults",children:[]},{value:"JavaScript Events",id:"javascript-events",children:[]}],f={toc:m};function p(e){var t=e.components,n=(0,i.Z)(e,s);return(0,r.kt)("wrapper",(0,a.Z)({},f,n,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"confirm-dialog"},"Confirm Dialog"),(0,r.kt)("h2",{id:"configurations"},"Configurations"),(0,r.kt)("p",null,"You can specify the configurations by passing in the data option inside your HTML."),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-javascript",metastring:"{3-10}","{3-10}":!0},'  link_to(\n    "Confirm", "fake/path",\n    data: {\n      confirm: "My confirm message",\n      "aa-confirm-dialog": {\n        buttons: {\n          ok: {text: "Okay!"}\n        }\n      }\n    }\n  )\n')),(0,r.kt)("h2",{id:"override-the-defaults"},"Override the Defaults"),(0,r.kt)("p",null,"You can override the default configurations by following the instructions below:"),(0,r.kt)(o.Z,{defaultValue:"css_class",values:[{label:"CSS Class",value:"css_class"},{label:"Translation",value:"translation"}],mdxType:"Tabs"},(0,r.kt)(l.Z,{value:"css_class",mdxType:"TabItem"},"To update the default CSS classes, you can create a ",(0,r.kt)("code",null,"css_claases.yml")," and specify the changes. See ",(0,r.kt)("a",{href:"/docs/start/configuration#css-classes"},"Configuration")," for more information.",(0,r.kt)("br",null),(0,r.kt)("br",null),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-yaml",metastring:'title="e.g., config/adminterface/admin/css_classes.yml" {2-5}',title:'"e.g.,','config/adminterface/admin/css_classes.yml"':!0,"{2-5}":!0},"---\nconfirm_dialog:\n  cancel: btn btn-light\n  ok: btn btn-primary\n"))),(0,r.kt)(l.Z,{value:"translation",mdxType:"TabItem"},"To update the translations, you can create an ",(0,r.kt)("code",null,"active_admin.en.yml")," file and specify the keys you want to update.",(0,r.kt)("br",null),(0,r.kt)("br",null),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-yaml",metastring:'title="config/locales/active_admin.en.yml" {4-7}',title:'"config/locales/active_admin.en.yml"',"{4-7}":!0},"---\nen:\n  active_admin:\n    confirm_dialog:\n      cancel: Cancel\n      ok: Okay!\n")))),(0,r.kt)("h2",{id:"javascript-events"},"JavaScript Events"),(0,r.kt)("p",null,"We've exposed a few events for hooking into the modal dialog's functionality."),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:"left"},"Type"),(0,r.kt)("th",{parentName:"tr",align:null},"Description"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"confirm_dialog:before_open")),(0,r.kt)("td",{parentName:"tr",align:null},"This event fires before the modal is shown")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"confirm_dialog:after_open")),(0,r.kt)("td",{parentName:"tr",align:null},"This event fires after the modal is shown")))),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-javascript"},'document.body.addEventListener("confirm_dialog:before_open", function() {\n  ...\n});\n')))}p.isMDXComponent=!0}}]);