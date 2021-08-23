"use strict";(self.webpackChunkwebsite=self.webpackChunkwebsite||[]).push([[323],{8215:function(e,t,a){var n=a(7294);t.Z=function(e){var t=e.children,a=e.hidden,i=e.className;return n.createElement("div",{role:"tabpanel",hidden:a,className:i},t)}},5064:function(e,t,a){a.d(t,{Z:function(){return m}});var n=a(7294),i=a(9443);var o=function(){var e=(0,n.useContext)(i.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},s=a(6010),r="tabItem_1uMI",l="tabItemActive_2DSg";var c=37,d=39;var m=function(e){var t=e.lazy,a=e.block,i=e.defaultValue,m=e.values,u=e.groupId,p=e.className,v=o(),g=v.tabGroupChoices,h=v.setTabGroupChoices,f=(0,n.useState)(i),b=f[0],k=f[1],N=n.Children.toArray(e.children),_=[];if(null!=u){var y=g[u];null!=y&&y!==b&&m.some((function(e){return e.value===y}))&&k(y)}var C=function(e){var t=e.currentTarget,a=_.indexOf(t),n=m[a].value;k(n),null!=u&&(h(u,n),setTimeout((function(){var e,a,n,i,o,s,r,c;(e=t.getBoundingClientRect(),a=e.top,n=e.left,i=e.bottom,o=e.right,s=window,r=s.innerHeight,c=s.innerWidth,a>=0&&o<=c&&i<=r&&n>=0)||(t.scrollIntoView({block:"center",behavior:"smooth"}),t.classList.add(l),setTimeout((function(){return t.classList.remove(l)}),2e3))}),150))},w=function(e){var t,a;switch(e.keyCode){case d:var n=_.indexOf(e.target)+1;a=_[n]||_[0];break;case c:var i=_.indexOf(e.target)-1;a=_[i]||_[_.length-1]}null==(t=a)||t.focus()};return n.createElement("div",{className:"tabs-container"},n.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,s.Z)("tabs",{"tabs--block":a},p)},m.map((function(e){var t=e.value,a=e.label;return n.createElement("li",{role:"tab",tabIndex:b===t?0:-1,"aria-selected":b===t,className:(0,s.Z)("tabs__item",r,{"tabs__item--active":b===t}),key:t,ref:function(e){return _.push(e)},onKeyDown:w,onFocus:C,onClick:C},a)}))),t?(0,n.cloneElement)(N.filter((function(e){return e.props.value===b}))[0],{className:"margin-vert--md"}):n.createElement("div",{className:"margin-vert--md"},N.map((function(e,t){return(0,n.cloneElement)(e,{key:t,hidden:e.props.value!==b})}))))}},7605:function(e,t,a){a.r(t),a.d(t,{frontMatter:function(){return c},contentTitle:function(){return d},metadata:function(){return m},toc:function(){return u},default:function(){return v}});var n=a(7462),i=a(3366),o=(a(7294),a(3905)),s=a(5064),r=a(8215),l=(a(6848),["components"]),c={sidebar_position:3},d="Batch Actions",m={unversionedId:"guides/batch-actions",id:"guides/batch-actions",isDocsHomePage:!1,title:"Batch Actions",description:"``mdx-code-block",source:"@site/docs/guides/batch-actions.mdx",sourceDirName:"guides",slug:"/guides/batch-actions",permalink:"/active_admin_bootstrap/docs/guides/batch-actions",editUrl:"https://github.com/CMDBrew/active_admin_bootstrap/edit/master/website/docs/guides/batch-actions.mdx",version:"current",sidebarPosition:3,frontMatter:{sidebar_position:3},sidebar:"tutorialSidebar",previous:{title:"Customizing the Form",permalink:"/active_admin_bootstrap/docs/guides/customizing-the-form"},next:{title:"Confirm Dialog",permalink:"/active_admin_bootstrap/docs/guides/confirm-dialog"}},u=[{value:"Inputs",id:"inputs",children:[]},{value:"Confirm Dialog",id:"confirm-dialog",children:[{value:"Override the Defaults",id:"override-the-defaults",children:[]}]}],p={toc:u};function v(e){var t=e.components,a=(0,i.Z)(e,l);return(0,o.kt)("wrapper",(0,n.Z)({},p,a,{components:t,mdxType:"MDXLayout"}),(0,o.kt)("h1",{id:"batch-actions"},"Batch Actions"),(0,o.kt)("p",null,"We've enhanced the ",(0,o.kt)("inlineCode",{parentName:"p"},"batch_action")," feature to make it more customizable and extendable. Here we only list the adjustments we've made. Please visit ",(0,o.kt)("a",{parentName:"p",href:"https://activeadmin.info/9-batch-actions.html"},"ActiveAdmin")," for basic configurations and usage guides."),(0,o.kt)("h2",{id:"inputs"},"Inputs"),(0,o.kt)("div",{className:"admonition admonition-caution alert alert--warning"},(0,o.kt)("div",{parentName:"div",className:"admonition-heading"},(0,o.kt)("h5",{parentName:"div"},(0,o.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,o.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"16",height:"16",viewBox:"0 0 16 16"},(0,o.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"}))),"caution")),(0,o.kt)("div",{parentName:"div",className:"admonition-content"},(0,o.kt)("p",{parentName:"div"},"The following input types are currently not supported:"),(0,o.kt)("ul",{parentName:"div"},(0,o.kt)("li",{parentName:"ul"},(0,o.kt)("inlineCode",{parentName:"li"},":file")),(0,o.kt)("li",{parentName:"ul"},(0,o.kt)("inlineCode",{parentName:"li"},":rich_text"))))),(0,o.kt)("div",{className:"admonition admonition-info alert alert--info"},(0,o.kt)("div",{parentName:"div",className:"admonition-heading"},(0,o.kt)("h5",{parentName:"div"},(0,o.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,o.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"14",height:"16",viewBox:"0 0 14 16"},(0,o.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"}))),"info")),(0,o.kt)("div",{parentName:"div",className:"admonition-content"},(0,o.kt)("p",{parentName:"div"},"We've updated input type namings to match with Formtastic inputs for consistency."),(0,o.kt)("ul",{parentName:"div"},(0,o.kt)("li",{parentName:"ul"},(0,o.kt)("inlineCode",{parentName:"li"},":text")," -> ",(0,o.kt)("inlineCode",{parentName:"li"},":string")),(0,o.kt)("li",{parentName:"ul"},(0,o.kt)("inlineCode",{parentName:"li"},":textarea")," -> ",(0,o.kt)("inlineCode",{parentName:"li"},":text")),(0,o.kt)("li",{parentName:"ul"},(0,o.kt)("inlineCode",{parentName:"li"},":checkbox")," -> ",(0,o.kt)("inlineCode",{parentName:"li"},":boolean"))))),(0,o.kt)(s.Z,{defaultValue:"basic",values:[{label:"Basic",value:"basic"},{label:"Explicit",value:"explicit"}],mdxType:"Tabs"},(0,o.kt)(r.Z,{value:"basic",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-ruby",metastring:'title="e.g., app/admin/users.rb" {3-5}',title:'"e.g.,','app/admin/users.rb"':!0,"{3-5}":!0},"ActiveAdmin.register User do\n  batch_action :flag, form: {\n    reason: :string,\n    notes:  :text,\n    hide:   :boolean,\n  } do |ids, inputs|\n    # ...\n  end\nend\n"))),(0,o.kt)(r.Z,{value:"explicit",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-ruby",metastring:'title="e.g., app/admin/users.rb" {3-5}',title:'"e.g.,','app/admin/users.rb"':!0,"{3-5}":!0},'ActiveAdmin.register User do\n  batch_action :flag, form: {\n    reason: {as: :string},\n    notes: {as: :text, input_html: {value: "custom-class"}},\n    hide: {as: :switch}\n  } do |ids, inputs|\n    ...\n  end\nend\n')))),(0,o.kt)("h2",{id:"confirm-dialog"},"Confirm Dialog"),(0,o.kt)("p",null,"You can specify the configurations for the confirm dialogue by passing in the ",(0,o.kt)("inlineCode",{parentName:"p"},"confirm_dialog")," option. See the ",(0,o.kt)("a",{parentName:"p",href:"/docs/guides/confirm-dialog"},"Confirm Dialog")," guide for more information."),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-ruby",metastring:'title="e.g., app/admin/users.rb" {2-5}',title:'"e.g.,','app/admin/users.rb"':!0,"{2-5}":!0},'ActiveAdmin.register User do\n  batch_action :flag, confirm_dialog: {\n    buttons: {\n      ok: {class: "btn btn-danger", text: "Confirm!!!"}\n    }\n  } do |ids, inputs|\n    ...\n  end\nend\n')),(0,o.kt)("h3",{id:"override-the-defaults"},"Override the Defaults"),(0,o.kt)(s.Z,{defaultValue:"css_class",values:[{label:"CSS Class",value:"css_class"},{label:"Translation",value:"translation"}],mdxType:"Tabs"},(0,o.kt)(r.Z,{value:"css_class",mdxType:"TabItem"},"To update the default CSS classes, you can create a ",(0,o.kt)("code",null,"css_claases.yml")," and specify the changes. See ",(0,o.kt)("a",{href:"/docs/start/configuration#css-classes"},"Configuration")," for more information.",(0,o.kt)("br",null),(0,o.kt)("br",null),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-yaml",metastring:'title="e.g., config/active_admin_bootstrap/admin/css_classes.yml" {2-6}',title:'"e.g.,','config/active_admin_bootstrap/admin/css_classes.yml"':!0,"{2-6}":!0},"---\ntable_tools:\n  confirm_dialog:\n    cancel: btn btn-link\n    ok: btn btn-primary\n"))),(0,o.kt)(r.Z,{value:"translation",mdxType:"TabItem"},"To update the translations, you can create an ",(0,o.kt)("code",null,"active_admin.en.yml")," file and specify the keys you want to update.",(0,o.kt)("br",null),(0,o.kt)("br",null),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-yaml",metastring:'title="config/locales/active_admin.en.yml" {4-7}',title:'"config/locales/active_admin.en.yml"',"{4-7}":!0},"---\nen:\n  active_admin:\n    batch_actions:\n      confirm_dialog:\n        cancel: Cancel\n        ok: Okay!\n")))))}v.isMDXComponent=!0}}]);