"use strict";(self.webpackChunkwebsite=self.webpackChunkwebsite||[]).push([[849],{8215:function(e,t,n){var a=n(7294);t.Z=function(e){var t=e.children,n=e.hidden,i=e.className;return a.createElement("div",{role:"tabpanel",hidden:n,className:i},t)}},5064:function(e,t,n){n.d(t,{Z:function(){return d}});var a=n(7294),i=n(9443);var s=function(){var e=(0,a.useContext)(i.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},o=n(6010),l="tabItem_1uMI",r="tabItemActive_2DSg";var d=function(e){var t,n=e.lazy,i=e.block,d=e.defaultValue,m=e.values,c=e.groupId,p=e.className,u=a.Children.toArray(e.children),h=null!=m?m:u.map((function(e){return{value:e.props.value,label:e.props.label}})),v=null!=d?d:null==(t=u.find((function(e){return e.props.default})))?void 0:t.props.value,b=s(),k=b.tabGroupChoices,g=b.setTabGroupChoices,f=(0,a.useState)(v),N=f[0],w=f[1],y=[];if(null!=c){var T=k[c];null!=T&&T!==N&&h.some((function(e){return e.value===T}))&&w(T)}var C=function(e){var t=e.currentTarget,n=y.indexOf(t),a=h[n].value;w(a),null!=c&&(g(c,a),setTimeout((function(){var e,n,a,i,s,o,l,d;(e=t.getBoundingClientRect(),n=e.top,a=e.left,i=e.bottom,s=e.right,o=window,l=o.innerHeight,d=o.innerWidth,n>=0&&s<=d&&i<=l&&a>=0)||(t.scrollIntoView({block:"center",behavior:"smooth"}),t.classList.add(r),setTimeout((function(){return t.classList.remove(r)}),2e3))}),150))},x=function(e){var t,n=null;switch(e.key){case"ArrowRight":var a=y.indexOf(e.target)+1;n=y[a]||y[0];break;case"ArrowLeft":var i=y.indexOf(e.target)-1;n=y[i]||y[y.length-1]}null==(t=n)||t.focus()};return a.createElement("div",{className:"tabs-container"},a.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,o.Z)("tabs",{"tabs--block":i},p)},h.map((function(e){var t=e.value,n=e.label;return a.createElement("li",{role:"tab",tabIndex:N===t?0:-1,"aria-selected":N===t,className:(0,o.Z)("tabs__item",l,{"tabs__item--active":N===t}),key:t,ref:function(e){return y.push(e)},onKeyDown:x,onFocus:C,onClick:C},null!=n?n:t)}))),n?(0,a.cloneElement)(u.filter((function(e){return e.props.value===N}))[0],{className:"margin-vert--md"}):a.createElement("div",{className:"margin-vert--md"},u.map((function(e,t){return(0,a.cloneElement)(e,{key:t,hidden:e.props.value!==N})}))))}},7550:function(e,t,n){n.r(t),n.d(t,{frontMatter:function(){return d},contentTitle:function(){return m},metadata:function(){return c},toc:function(){return p},default:function(){return h}});var a=n(7462),i=n(3366),s=(n(7294),n(3905)),o=n(5064),l=n(8215),r=(n(9354),["components"]),d={sidebar_position:1},m="Arbre Components",c={unversionedId:"enhancements/components",id:"enhancements/components",isDocsHomePage:!1,title:"Arbre Components",description:"Adminterface inherits [ActiveAdmin]'s components and applied [Bootstrap] styles. In addition, we've added new components and made some enhancements to the existing ones. Please see [ActiveAdmin] for basic usage guides.",source:"@site/docs/enhancements/components.mdx",sourceDirName:"enhancements",slug:"/enhancements/components",permalink:"/adminterface/docs/enhancements/components",editUrl:"https://github.com/CMDBrew/adminterface/edit/main/website/docs/enhancements/components.mdx",tags:[],version:"current",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"tutorialSidebar",previous:{title:"Dependencies",permalink:"/adminterface/docs/start/dependencies"},next:{title:"Index Page",permalink:"/adminterface/docs/enhancements/index"}},p=[{value:"Icons",id:"icons",children:[]},{value:"Panels",id:"panels",children:[{value:"Optional Title",id:"optional-title",children:[]},{value:"HTML Options",id:"html-options",children:[]}]},{value:"Columns",id:"columns",children:[{value:"Gutter",id:"gutter",children:[]},{value:"Sizing",id:"sizing",children:[]}]},{value:"Table For",id:"table-for",children:[{value:"Scrolling",id:"scrolling",children:[]}]},{value:"Tabs",id:"tabs",children:[{value:"HTML Options",id:"html-options-1",children:[]},{value:"HTTP Tabs",id:"http-tabs",children:[]}]}],u={toc:p};function h(e){var t=e.components,n=(0,i.Z)(e,r);return(0,s.kt)("wrapper",(0,a.Z)({},u,n,{components:t,mdxType:"MDXLayout"}),(0,s.kt)("h1",{id:"arbre-components"},"Arbre Components"),(0,s.kt)("p",null,"Adminterface inherits ",(0,s.kt)("a",{parentName:"p",href:"https://activeadmin.info/12-arbre-components.html"},"ActiveAdmin"),"'s components and applied ",(0,s.kt)("a",{parentName:"p",href:"https://getbootstrap.com/docs/5.0/"},"Bootstrap")," styles. In addition, we've added new components and made some enhancements to the existing ones. Please see ",(0,s.kt)("a",{parentName:"p",href:"https://activeadmin.info/12-arbre-components.html"},"ActiveAdmin")," for basic usage guides."),(0,s.kt)("div",{className:"admonition admonition-caution alert alert--warning"},(0,s.kt)("div",{parentName:"div",className:"admonition-heading"},(0,s.kt)("h5",{parentName:"div"},(0,s.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,s.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"16",height:"16",viewBox:"0 0 16 16"},(0,s.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"}))),"caution")),(0,s.kt)("div",{parentName:"div",className:"admonition-content"},(0,s.kt)("p",{parentName:"div"},"These components works inside ",(0,s.kt)("inlineCode",{parentName:"p"},".rb")," or ",(0,s.kt)("inlineCode",{parentName:"p"},".arb")," files within the ActiveAdmin context."))),(0,s.kt)("h2",{id:"icons"},"Icons"),(0,s.kt)("p",null,"We've added a helper to render icons inside ",(0,s.kt)("a",{parentName:"p",href:"https://activeadmin.info/12-arbre-components.html"},"ActiveAdmin"),". The default icons are ",(0,s.kt)("a",{parentName:"p",href:"https://icons.getbootstrap.com/"},"Bootstrap Icons")," using the ",(0,s.kt)("inlineCode",{parentName:"p"},"bi")," class. If you wish, you can change the default icon class like below:"),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-yml",metastring:'title="config/adminterface/.../css_classes.yml" {2}',title:'"config/adminterface/.../css_classes.yml"',"{2}":!0},"---\nicon: your-custom-class\n")),(0,s.kt)("p",null,"To render the icon inside Arbre, call:"),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-ruby"},'aa_icon("bi-alarm")\n')),(0,s.kt)("h2",{id:"panels"},"Panels"),(0,s.kt)("p",null,"See ",(0,s.kt)("a",{parentName:"p",href:"https://activeadmin.info/12-arbre-components.html#panels"},"ActiveAdmin")," for usage guides."),(0,s.kt)("h3",{id:"optional-title"},"Optional Title"),(0,s.kt)("p",null,"We've removed the requirements for the ",(0,s.kt)("inlineCode",{parentName:"p"},"title")," param. If you don't pass in the title param or passed in an empty value, the panel header will not be visible."),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-ruby",metastring:"{1,5}","{1,5}":!0},'panel do\n  h1 "Hello world"\nend\n\npanel "" do\n  h1 "Hello world"\nend\n')),(0,s.kt)("h3",{id:"html-options"},"HTML Options"),(0,s.kt)("p",null,"You can add additional attributes to the panel's header and body using ",(0,s.kt)("inlineCode",{parentName:"p"},"header_html")," and ",(0,s.kt)("inlineCode",{parentName:"p"},"body_html"),"."),(0,s.kt)(o.Z,{defaultValue:"header",values:[{label:"Header",value:"header"},{label:"Body",value:"body"}],mdxType:"Tabs"},(0,s.kt)(l.Z,{value:"header",mdxType:"TabItem"},(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-ruby",metastring:"{1}","{1}":!0},'panel header_html: {class: "my-header-class"} do\n  h1 "Hello world"\nend\n'))),(0,s.kt)(l.Z,{value:"body",mdxType:"TabItem"},(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-ruby",metastring:"{1}","{1}":!0},'panel body_html: {class: "my-body-class"} do\n  h1 "Hello world"\nend\n')))),(0,s.kt)("h2",{id:"columns"},"Columns"),(0,s.kt)("p",null,"We've replaced the inline css in ActiveAdmin's columns with ",(0,s.kt)("a",{parentName:"p",href:"https://getbootstrap.com/docs/5.0/layout/grid/"},"Bootstrap"),". See ",(0,s.kt)("a",{parentName:"p",href:"https://activeadmin.info/12-arbre-components.html#columns"},"ActiveAdmin")," for usage guides."),(0,s.kt)("div",{className:"admonition admonition-caution alert alert--warning"},(0,s.kt)("div",{parentName:"div",className:"admonition-heading"},(0,s.kt)("h5",{parentName:"div"},(0,s.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,s.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"16",height:"16",viewBox:"0 0 16 16"},(0,s.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"}))),"caution")),(0,s.kt)("div",{parentName:"div",className:"admonition-content"},(0,s.kt)("p",{parentName:"div"},(0,s.kt)("inlineCode",{parentName:"p"},":max_width")," and ",(0,s.kt)("inlineCode",{parentName:"p"},":min_width")," options no longer works."))),(0,s.kt)("h3",{id:"gutter"},"Gutter"),(0,s.kt)("p",null,"You can change the gutter between columns by passing in your own gutter class."),(0,s.kt)(o.Z,{defaultValue:"input",values:[{label:"Ruby",value:"input"},{label:"HTML",value:"output"}],mdxType:"Tabs"},(0,s.kt)(l.Z,{value:"input",mdxType:"TabItem"},(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-ruby",metastring:"{1}","{1}":!0},'columns(class: "g-5") do\n  ...\nend\n'))),(0,s.kt)(l.Z,{value:"output",mdxType:"TabItem"},(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-html",metastring:"{1}","{1}":!0},'<div class="g-5 row">\n  ...\n</div>\n')))),(0,s.kt)("h3",{id:"sizing"},"Sizing"),(0,s.kt)("p",null,"You can change the breakpoint of the columns by passing in ",(0,s.kt)("inlineCode",{parentName:"p"},"size"),"."),(0,s.kt)(o.Z,{defaultValue:"input",values:[{label:"Ruby",value:"input"},{label:"HTML",value:"output"}],mdxType:"Tabs"},(0,s.kt)(l.Z,{value:"input",mdxType:"TabItem"},(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-ruby",metastring:"{2,6}","{2,6}":!0},'columns do\n  column(class: "custom-column", size: "md", span: 8) do\n    ...\n  end\n\n  column(class: "custom-column", size: "md", span: 4) do\n    ...\n  end\nend\n'))),(0,s.kt)(l.Z,{value:"output",mdxType:"TabItem"},(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-html",metastring:"{2,6}","{2,6}":!0},'<div class="g-3 row">\n  <div class="col-md-8 custom-column">\n    ...\n  </div>\n\n  <div class="col-md-4 custom-column">\n    ...\n  </div>\n</div>\n')))),(0,s.kt)("h2",{id:"table-for"},"Table For"),(0,s.kt)("p",null,"See ",(0,s.kt)("a",{parentName:"p",href:"https://activeadmin.info/12-arbre-components.html#table_for"},"ActiveAdmin")," for usage guides."),(0,s.kt)("h3",{id:"scrolling"},"Scrolling"),(0,s.kt)("p",null,"You can add scrolling to tables by usings ",(0,s.kt)("a",{parentName:"p",href:"https://getbootstrap.com/docs/5.0/"},"Bootstrap"),"'s ",(0,s.kt)("inlineCode",{parentName:"p"},".table-responsive")," class."),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-ruby",metastring:"{1}","{1}":!0},'div class: "table-responsive" do\n  table_for order.payments do\n    ...\n  end\nend\n')),(0,s.kt)("h2",{id:"tabs"},"Tabs"),(0,s.kt)("p",null,"We've replaced jQuery with ",(0,s.kt)("a",{parentName:"p",href:"https://getbootstrap.com/docs/5.0/"},"Bootstrap"),". See ",(0,s.kt)("a",{parentName:"p",href:"https://activeadmin.info/12-arbre-components.html#tabs"},"ActiveAdmin")," for usage guides."),(0,s.kt)("h3",{id:"html-options-1"},"HTML Options"),(0,s.kt)("p",null,"You can add additional attributes to the tab's nav and content using ",(0,s.kt)("inlineCode",{parentName:"p"},":nav_html")," and ",(0,s.kt)("inlineCode",{parentName:"p"},":content_html"),"."),(0,s.kt)(o.Z,{defaultValue:"nav",values:[{label:"Nav",value:"nav"},{label:"Content",value:"content"}],mdxType:"Tabs"},(0,s.kt)(l.Z,{value:"nav",mdxType:"TabItem"},(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-ruby",metastring:"{1}","{1}":!0},'tabs nav_html: {class: "my-tabs-nav"} do\n  tab "tab-1" { ... }\n  tab "tab-2" { ... }\nend\n'))),(0,s.kt)(l.Z,{value:"content",mdxType:"TabItem"},(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-ruby",metastring:"{1}","{1}":!0},'tabs content_html: {class: "my-tabs-content"} do\n  tab "tab-1" { ... }\n  tab "tab-2" { ... }\nend\n')))),(0,s.kt)("h3",{id:"http-tabs"},"HTTP Tabs"),(0,s.kt)("p",null,"For load-intensive tabs, you might want the page to refresh when the user visits another tab. To achieve this, you can passing ",(0,s.kt)("inlineCode",{parentName:"p"},"http: true")," to it."),(0,s.kt)("div",{className:"admonition admonition-tip alert alert--success"},(0,s.kt)("div",{parentName:"div",className:"admonition-heading"},(0,s.kt)("h5",{parentName:"div"},(0,s.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,s.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,s.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M6.5 0C3.48 0 1 2.19 1 5c0 .92.55 2.25 1 3 1.34 2.25 1.78 2.78 2 4v1h5v-1c.22-1.22.66-1.75 2-4 .45-.75 1-2.08 1-3 0-2.81-2.48-5-5.5-5zm3.64 7.48c-.25.44-.47.8-.67 1.11-.86 1.41-1.25 2.06-1.45 3.23-.02.05-.02.11-.02.17H5c0-.06 0-.13-.02-.17-.2-1.17-.59-1.83-1.45-3.23-.2-.31-.42-.67-.67-1.11C2.44 6.78 2 5.65 2 5c0-2.2 2.02-4 4.5-4 1.22 0 2.36.42 3.22 1.19C10.55 2.94 11 3.94 11 5c0 .66-.44 1.78-.86 2.48zM4 14h5c-.23 1.14-1.3 2-2.5 2s-2.27-.86-2.5-2z"}))),"tip")),(0,s.kt)("div",{parentName:"div",className:"admonition-content"},(0,s.kt)("p",{parentName:"div"},"If you add an ",(0,s.kt)("inlineCode",{parentName:"p"},":id")," to the tab, it will automatically set as the anchor for the nav links."))),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-ruby",metastring:"{1}","{1}":!0},'tabs http: true, id: "test" do\n  tab "tab-1" { ... }\n  tab "tab-2" { ... }\nend\n')),(0,s.kt)("div",{className:"admonition admonition-tip alert alert--success"},(0,s.kt)("div",{parentName:"div",className:"admonition-heading"},(0,s.kt)("h5",{parentName:"div"},(0,s.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,s.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,s.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M6.5 0C3.48 0 1 2.19 1 5c0 .92.55 2.25 1 3 1.34 2.25 1.78 2.78 2 4v1h5v-1c.22-1.22.66-1.75 2-4 .45-.75 1-2.08 1-3 0-2.81-2.48-5-5.5-5zm3.64 7.48c-.25.44-.47.8-.67 1.11-.86 1.41-1.25 2.06-1.45 3.23-.02.05-.02.11-.02.17H5c0-.06 0-.13-.02-.17-.2-1.17-.59-1.83-1.45-3.23-.2-.31-.42-.67-.67-1.11C2.44 6.78 2 5.65 2 5c0-2.2 2.02-4 4.5-4 1.22 0 2.36.42 3.22 1.19C10.55 2.94 11 3.94 11 5c0 .66-.44 1.78-.86 2.48zM4 14h5c-.23 1.14-1.3 2-2.5 2s-2.27-.86-2.5-2z"}))),"tip")),(0,s.kt)("div",{parentName:"div",className:"admonition-content"},(0,s.kt)("p",{parentName:"div"},"The browser memorizes the ",(0,s.kt)("inlineCode",{parentName:"p"},"tab")," parameter in the session and redirects users to the correct tab for form submissions!."))),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-ruby",metastring:'title="e.g., app/admin/users.rb" {4}',title:'"e.g.,','app/admin/users.rb"':!0,"{4}":!0},'ActiveAdmin.register User do\n  form do |f|\n    panel do\n      tabs http: true, id: "user-form" do\n        tab :info do\n          f.inputs do\n            f.input :name\n          end\n        end\n        tab :password do\n          f.inputs do\n            f.input :password\n          end\n        end\n      end\n\n      f.actions\n    end\n  end\nend\n')))}h.isMDXComponent=!0}}]);