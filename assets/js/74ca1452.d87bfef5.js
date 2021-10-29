"use strict";(self.webpackChunkwebsite=self.webpackChunkwebsite||[]).push([[3002],{6061:function(e,t,a){a.d(t,{ZP:function(){return o}});var n=a(7462),i=a(3366),r=(a(7294),a(3905)),l=["components"],s={toc:[]};function o(e){var t=e.components,a=(0,i.Z)(e,l);return(0,r.kt)("wrapper",(0,n.Z)({},s,a,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("div",{className:"admonition admonition-caution alert alert--warning"},(0,r.kt)("div",{parentName:"div",className:"admonition-heading"},(0,r.kt)("h5",{parentName:"div"},(0,r.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,r.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"16",height:"16",viewBox:"0 0 16 16"},(0,r.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"}))),"caution")),(0,r.kt)("div",{parentName:"div",className:"admonition-content"},(0,r.kt)("p",{parentName:"div"},"This command will ask for permissions to overwrite files generated by ActiveAdmin. Make sure to review the files carefully and accept them.\nWe recommend you commit your files before running this command to ensure you are aware of the changes made."))))}o.isMDXComponent=!0},8215:function(e,t,a){var n=a(7294);t.Z=function(e){var t=e.children,a=e.hidden,i=e.className;return n.createElement("div",{role:"tabpanel",hidden:a,className:i},t)}},5064:function(e,t,a){a.d(t,{Z:function(){return m}});var n=a(7294),i=a(9443);var r=function(){var e=(0,n.useContext)(i.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},l=a(6010),s="tabItem_1uMI",o="tabItemActive_2DSg";var m=function(e){var t,a=e.lazy,i=e.block,m=e.defaultValue,p=e.values,d=e.groupId,c=e.className,u=n.Children.toArray(e.children),k=null!=p?p:u.map((function(e){return{value:e.props.value,label:e.props.label}})),N=null!=m?m:null==(t=u.find((function(e){return e.props.default})))?void 0:t.props.value,v=r(),f=v.tabGroupChoices,g=v.setTabGroupChoices,h=(0,n.useState)(N),b=h[0],w=h[1],C=[];if(null!=d){var y=f[d];null!=y&&y!==b&&k.some((function(e){return e.value===y}))&&w(y)}var _=function(e){var t=e.currentTarget,a=C.indexOf(t),n=k[a].value;w(n),null!=d&&(g(d,n),setTimeout((function(){var e,a,n,i,r,l,s,m;(e=t.getBoundingClientRect(),a=e.top,n=e.left,i=e.bottom,r=e.right,l=window,s=l.innerHeight,m=l.innerWidth,a>=0&&r<=m&&i<=s&&n>=0)||(t.scrollIntoView({block:"center",behavior:"smooth"}),t.classList.add(o),setTimeout((function(){return t.classList.remove(o)}),2e3))}),150))},x=function(e){var t,a=null;switch(e.key){case"ArrowRight":var n=C.indexOf(e.target)+1;a=C[n]||C[0];break;case"ArrowLeft":var i=C.indexOf(e.target)-1;a=C[i]||C[C.length-1]}null==(t=a)||t.focus()};return n.createElement("div",{className:"tabs-container"},n.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,l.Z)("tabs",{"tabs--block":i},c)},k.map((function(e){var t=e.value,a=e.label;return n.createElement("li",{role:"tab",tabIndex:b===t?0:-1,"aria-selected":b===t,className:(0,l.Z)("tabs__item",s,{"tabs__item--active":b===t}),key:t,ref:function(e){return C.push(e)},onKeyDown:x,onFocus:_,onClick:_},null!=a?a:t)}))),a?(0,n.cloneElement)(u.filter((function(e){return e.props.value===b}))[0],{className:"margin-vert--md"}):n.createElement("div",{className:"margin-vert--md"},u.map((function(e,t){return(0,n.cloneElement)(e,{key:t,hidden:e.props.value!==b})}))))}},1586:function(e,t,a){a.r(t),a.d(t,{frontMatter:function(){return p},contentTitle:function(){return d},metadata:function(){return c},toc:function(){return u},default:function(){return N}});var n=a(7462),i=a(3366),r=(a(7294),a(3905)),l=a(6061),s=a(5064),o=a(8215),m=(a(6488),["components"]),p={sidebar_position:2,description:"Adminterface Command Line Reference."},d="Command Line Reference",c={unversionedId:"start/cli",id:"start/cli",isDocsHomePage:!1,title:"Command Line Reference",description:"Adminterface Command Line Reference.",source:"@site/docs/start/cli.mdx",sourceDirName:"start",slug:"/start/cli",permalink:"/docs/start/cli",editUrl:"https://github.com/CMDBrew/adminterface/edit/main/website/docs/start/cli.mdx",tags:[],version:"current",sidebarPosition:2,frontMatter:{sidebar_position:2,description:"Adminterface Command Line Reference."},sidebar:"tutorialSidebar",previous:{title:"Installation",permalink:"/docs/start/installation"},next:{title:"Dependencies",permalink:"/docs/start/dependencies"}},u=[{value:"Generators",id:"generators",children:[{value:"Install",id:"install",children:[]},{value:"Comments",id:"comments",children:[]},{value:"Webpacker",id:"webpacker",children:[]},{value:"Configurations",id:"configurations",children:[]},{value:"Views",id:"views",children:[]}]}],k={toc:u};function N(e){var t=e.components,a=(0,i.Z)(e,m);return(0,r.kt)("wrapper",(0,n.Z)({},k,a,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"command-line-reference"},"Command Line Reference"),(0,r.kt)("h2",{id:"generators"},"Generators"),(0,r.kt)("h3",{id:"install"},"Install"),(0,r.kt)("p",null,"Installs Adminterface and generates necessary files and migrations"),(0,r.kt)(l.ZP,{mdxType:"InstallNotice"}),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-bash"},"$ rails g adminterface:install\n")),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:"left"},"Options"),(0,r.kt)("th",{parentName:"tr",align:"left"},"Alias"),(0,r.kt)("th",{parentName:"tr",align:"left"},"Default"),(0,r.kt)("th",{parentName:"tr",align:"left"},"Descriptions"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"--skip_comments")),(0,r.kt)("td",{parentName:"tr",align:"left"}),(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"false")),(0,r.kt)("td",{parentName:"tr",align:"left"},"Skip installation of ActionText for comments")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"--skip_examples")),(0,r.kt)("td",{parentName:"tr",align:"left"}),(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"false")),(0,r.kt)("td",{parentName:"tr",align:"left"},"Skip adding sample admin files")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"--use_webpacker")),(0,r.kt)("td",{parentName:"tr",align:"left"}),(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"true")),(0,r.kt)("td",{parentName:"tr",align:"left"},"Install assets with webpacker")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"--version")),(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"-v")),(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"Adminterface::VERSION")),(0,r.kt)("td",{parentName:"tr",align:"left"},"Install with a specific version")))),(0,r.kt)("p",null,"This will:"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},"Run ",(0,r.kt)("inlineCode",{parentName:"li"},"rails g adminterface:comments")),(0,r.kt)("li",{parentName:"ul"},"Run ",(0,r.kt)("inlineCode",{parentName:"li"},"rails g adminterface:webpacker")),(0,r.kt)("li",{parentName:"ul"},"Overwrite the ",(0,r.kt)("inlineCode",{parentName:"li"},"admin/dashboard.rb")," file")),(0,r.kt)("h3",{id:"comments"},"Comments"),(0,r.kt)("p",null,"Add ",(0,r.kt)("inlineCode",{parentName:"p"},"ActionText")," to ",(0,r.kt)("inlineCode",{parentName:"p"},"ActiveAdmin::Comment")),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-bash"},"$ rails g adminterface:comments\n")),(0,r.kt)("p",null,"This will:"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},"Install Rails ",(0,r.kt)("inlineCode",{parentName:"li"},"action_text")," and ",(0,r.kt)("inlineCode",{parentName:"li"},"active_storage")),(0,r.kt)("li",{parentName:"ul"},"Create a migration: ",(0,r.kt)("inlineCode",{parentName:"li"},"drop_body_for_active_admin_comments.rb")),(0,r.kt)("li",{parentName:"ul"},"Create an initializer ",(0,r.kt)("inlineCode",{parentName:"li"},"initializers/active_admin_comment_action_text.rb"))),(0,r.kt)("div",{className:"admonition admonition-tip alert alert--success"},(0,r.kt)("div",{parentName:"div",className:"admonition-heading"},(0,r.kt)("h5",{parentName:"div"},(0,r.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,r.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,r.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M6.5 0C3.48 0 1 2.19 1 5c0 .92.55 2.25 1 3 1.34 2.25 1.78 2.78 2 4v1h5v-1c.22-1.22.66-1.75 2-4 .45-.75 1-2.08 1-3 0-2.81-2.48-5-5.5-5zm3.64 7.48c-.25.44-.47.8-.67 1.11-.86 1.41-1.25 2.06-1.45 3.23-.02.05-.02.11-.02.17H5c0-.06 0-.13-.02-.17-.2-1.17-.59-1.83-1.45-3.23-.2-.31-.42-.67-.67-1.11C2.44 6.78 2 5.65 2 5c0-2.2 2.02-4 4.5-4 1.22 0 2.36.42 3.22 1.19C10.55 2.94 11 3.94 11 5c0 .66-.44 1.78-.86 2.48zM4 14h5c-.23 1.14-1.3 2-2.5 2s-2.27-.86-2.5-2z"}))),"tip")),(0,r.kt)("div",{parentName:"div",className:"admonition-content"},(0,r.kt)("ul",{parentName:"div"},(0,r.kt)("li",{parentName:"ul"},"Your existing data is saved inside the ",(0,r.kt)("inlineCode",{parentName:"li"},"body_backup")," column by default"),(0,r.kt)("li",{parentName:"ul"},"Un-comment the lines inside the ",(0,r.kt)("inlineCode",{parentName:"li"},"drop_body_for_active_admin_comments.rb")," migration file to migrate existing data from the ",(0,r.kt)("inlineCode",{parentName:"li"},"ActiveAdmin::Comment")," table to ",(0,r.kt)("inlineCode",{parentName:"li"},"ActionText::RichText"))))),(0,r.kt)("h3",{id:"webpacker"},"Webpacker"),(0,r.kt)("p",null,"Install Stylesheets and JavaScripts using Webpacker"),(0,r.kt)("div",{className:"admonition admonition-caution alert alert--warning"},(0,r.kt)("div",{parentName:"div",className:"admonition-heading"},(0,r.kt)("h5",{parentName:"div"},(0,r.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,r.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"16",height:"16",viewBox:"0 0 16 16"},(0,r.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"}))),"caution")),(0,r.kt)("div",{parentName:"div",className:"admonition-content"},(0,r.kt)("p",{parentName:"div"},"We don't currently support using Sprockets"))),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-bash"},"$ rails g adminterface:webpacker\n")),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:"left"},"Options"),(0,r.kt)("th",{parentName:"tr",align:"left"},"Alias"),(0,r.kt)("th",{parentName:"tr",align:"left"},"Default"),(0,r.kt)("th",{parentName:"tr",align:"left"},"Descriptions"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"--version")),(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"-v")),(0,r.kt)("td",{parentName:"tr",align:"left"},(0,r.kt)("inlineCode",{parentName:"td"},"Adminterface::VERSION")),(0,r.kt)("td",{parentName:"tr",align:"left"},"Install with a specific version")))),(0,r.kt)("p",null,"This will:"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},"Add ",(0,r.kt)("inlineCode",{parentName:"p"},"resolve-url-loader")," to ",(0,r.kt)("inlineCode",{parentName:"p"},"environment.js")),(0,r.kt)("pre",{parentName:"li"},(0,r.kt)("code",{parentName:"pre",className:"language-javascript",metastring:'title="config/webpack/environment.js" {3-5}',title:'"config/webpack/environment.js"',"{3-5}":!0},"const { environment } = require('@rails/webpacker')\n\nenvironment.loaders.get('sass').use.splice(-1, 0, {\n   loader: 'resolve-url-loader'\n})\n\nmodule.exports = environment\n"))),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},"Install Adminterface's NPM package via Yarn"),(0,r.kt)("pre",{parentName:"li"},(0,r.kt)("code",{parentName:"pre",className:"language-bash"},"$ yarn add @cmdbrew/adminterface\n"))),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},"Replace the assets"),(0,r.kt)("pre",{parentName:"li"},(0,r.kt)("code",{parentName:"pre",className:"language-javascript",metastring:'title="app/javascript/packs/active_admin.js"',title:'"app/javascript/packs/active_admin.js"'},"import '../stylesheets/active_admin'\n\nimport Rails from '@rails/ujs'\nimport '@cmdbrew/adminterface'\n\nRails.start()\n")),(0,r.kt)("pre",{parentName:"li"},(0,r.kt)("code",{parentName:"pre",className:"language-scss",metastring:'title="app/javascript/stylesheets/active_admin.scss"',title:'"app/javascript/stylesheets/active_admin.scss"'},'@import "~@cmdbrew/adminterface/src/scss/base";\n'))),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},"Set ",(0,r.kt)("inlineCode",{parentName:"p"},"use_webpacker = true")," in ",(0,r.kt)("inlineCode",{parentName:"p"},"active_admin.rb"),"."),(0,r.kt)("pre",{parentName:"li"},(0,r.kt)("code",{parentName:"pre",className:"language-ruby",metastring:'title="config/initializers/active_admin.rb" {3}',title:'"config/initializers/active_admin.rb"',"{3}":!0},"ActiveAdmin.setup do |config|\n  ...\n  config.use_webpacker = true\n  ...\nend\n"))),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},"Remove unnecessary dependencies from ActiveAdmin such as jQuery."))),(0,r.kt)("h3",{id:"configurations"},"Configurations"),(0,r.kt)("p",null,"Copies config files into a directory for customization"),(0,r.kt)(s.Z,{defaultValue:"syntax",values:[{label:"Syntax",value:"syntax"},{label:"Example",value:"example"}],mdxType:"Tabs"},(0,r.kt)(o.Z,{value:"syntax",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-bash"},"$ rails g adminterface:configs [NAMESPACE]\n"))),(0,r.kt)(o.Z,{value:"example",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-bash"},"$ rails g adminterface:configs admin/users\n")))),(0,r.kt)("p",null,"This will copy the following files to ",(0,r.kt)("inlineCode",{parentName:"p"},"/config/adminterface/NAMESPACE"),":"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("inlineCode",{parentName:"li"},"components.yml")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("inlineCode",{parentName:"li"},"css_classes.yml"))),(0,r.kt)("p",null,"See ",(0,r.kt)("a",{parentName:"p",href:"/docs/enhancements/customizations"},"Customizations")," for usage guides and options."),(0,r.kt)("div",{className:"admonition admonition-tip alert alert--success"},(0,r.kt)("div",{parentName:"div",className:"admonition-heading"},(0,r.kt)("h5",{parentName:"div"},(0,r.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,r.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,r.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M6.5 0C3.48 0 1 2.19 1 5c0 .92.55 2.25 1 3 1.34 2.25 1.78 2.78 2 4v1h5v-1c.22-1.22.66-1.75 2-4 .45-.75 1-2.08 1-3 0-2.81-2.48-5-5.5-5zm3.64 7.48c-.25.44-.47.8-.67 1.11-.86 1.41-1.25 2.06-1.45 3.23-.02.05-.02.11-.02.17H5c0-.06 0-.13-.02-.17-.2-1.17-.59-1.83-1.45-3.23-.2-.31-.42-.67-.67-1.11C2.44 6.78 2 5.65 2 5c0-2.2 2.02-4 4.5-4 1.22 0 2.36.42 3.22 1.19C10.55 2.94 11 3.94 11 5c0 .66-.44 1.78-.86 2.48zM4 14h5c-.23 1.14-1.3 2-2.5 2s-2.27-.86-2.5-2z"}))),"tip")),(0,r.kt)("div",{parentName:"div",className:"admonition-content"},(0,r.kt)("p",{parentName:"div"},"This command helps you separate configurations for components and CSS classes for individual scopes to keep your code tidy."))),(0,r.kt)("h3",{id:"views"},"Views"),(0,r.kt)("p",null,"Copies view templates for customization"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-bash"},"$ rails g adminterface:views\n")),(0,r.kt)("p",null,"This will copy the following view templates to your application:"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("inlineCode",{parentName:"li"},"active_admin/devise/*")," templates"),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("inlineCode",{parentName:"li"},"kaminari/active_admin/*")," templates"),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("inlineCode",{parentName:"li"},"layouts/active_admin_logged_out.html.erb")," templates")))}N.isMDXComponent=!0}}]);