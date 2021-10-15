"use strict";(self.webpackChunkwebsite=self.webpackChunkwebsite||[]).push([[564],{4838:function(e,n,i){i.r(n),i.d(n,{frontMatter:function(){return o},contentTitle:function(){return c},metadata:function(){return l},toc:function(){return d},default:function(){return m}});var t=i(7462),a=i(3366),r=(i(7294),i(3905)),s=["components"],o={sidebar_position:99,description:"Adminterface License Configuration Guide"},c="Licensing",l={unversionedId:"start/licensing",id:"start/licensing",isDocsHomePage:!1,title:"Licensing",description:"Adminterface License Configuration Guide",source:"@site/docs/start/licensing.mdx",sourceDirName:"start",slug:"/start/licensing",permalink:"/docs/start/licensing",editUrl:"https://github.com/CMDBrew/adminterface/edit/main/website/docs/start/licensing.mdx",tags:[],version:"current",sidebarPosition:99,frontMatter:{sidebar_position:99,description:"Adminterface License Configuration Guide"},sidebar:"tutorialSidebar",previous:{title:"Dependencies",permalink:"/docs/start/dependencies"},next:{title:"Arbre Components",permalink:"/docs/enhancements/components"}},d=[{value:"Everything&#39;s included, always",id:"everythings-included-always",children:[]},{value:"One license per project",id:"one-license-per-project",children:[]},{value:"Purchase a license",id:"purchase-a-license",children:[]},{value:"Add the license key",id:"add-the-license-key",children:[]},{value:"License verification",id:"license-verification",children:[]}],p={toc:d};function m(e){var n=e.components,i=(0,a.Z)(e,s);return(0,r.kt)("wrapper",(0,t.Z)({},p,i,{components:n,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"licensing"},"Licensing"),(0,r.kt)("p",null,"Adminterface is free for personal and non-commercial use and with a yearly subscription for commercial purposes. See ",(0,r.kt)("a",{parentName:"p",href:"/docs/terms"},"our Terms of Service in full text")," for more information."),(0,r.kt)("div",{className:"admonition admonition-tip alert alert--success"},(0,r.kt)("div",{parentName:"div",className:"admonition-heading"},(0,r.kt)("h5",{parentName:"div"},(0,r.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,r.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,r.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M6.5 0C3.48 0 1 2.19 1 5c0 .92.55 2.25 1 3 1.34 2.25 1.78 2.78 2 4v1h5v-1c.22-1.22.66-1.75 2-4 .45-.75 1-2.08 1-3 0-2.81-2.48-5-5.5-5zm3.64 7.48c-.25.44-.47.8-.67 1.11-.86 1.41-1.25 2.06-1.45 3.23-.02.05-.02.11-.02.17H5c0-.06 0-.13-.02-.17-.2-1.17-.59-1.83-1.45-3.23-.2-.31-.42-.67-.67-1.11C2.44 6.78 2 5.65 2 5c0-2.2 2.02-4 4.5-4 1.22 0 2.36.42 3.22 1.19C10.55 2.94 11 3.94 11 5c0 .66-.44 1.78-.86 2.48zM4 14h5c-.23 1.14-1.3 2-2.5 2s-2.27-.86-2.5-2z"}))),"tip")),(0,r.kt)("div",{parentName:"div",className:"admonition-content"},(0,r.kt)("p",{parentName:"div"},'\ud83e\udd17 We appreciate your support for purchasing the "Commercial License" plan and help us make Adminterface better.'))),(0,r.kt)("h2",{id:"everythings-included-always"},"Everything's included, always"),(0,r.kt)("p",null,"Every pricing plan will always include all features. There are absolutely no functionality differences with Adminterface's pricing plan."),(0,r.kt)("h2",{id:"one-license-per-project"},"One license per project"),(0,r.kt)("p",null,"Each license permits you to run one commercial project in the production environment."),(0,r.kt)("h2",{id:"purchase-a-license"},"Purchase a license"),(0,r.kt)("p",null,'We are currently working on the customer\'s dashboard. But, for now, you can purchase a license from the "Register for the beta" link on ',(0,r.kt)("a",{parentName:"p",href:"https://adminterface.io/pricing"},"https://adminterface.io/pricing"),"."),(0,r.kt)("p",null,"You will receive a copy of your license key through email after we have confirmed your purchase."),(0,r.kt)("h2",{id:"add-the-license-key"},"Add the license key"),(0,r.kt)("p",null,"Create and add the ",(0,r.kt)("inlineCode",{parentName:"p"},"license_key")," into the following file in your project:"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-ruby",metastring:'title="config/initializers/adminterface.rb" {2,6,9}',title:'"config/initializers/adminterface.rb"',"{2,6,9}":!0},'Adminterface.setup do |config|\n  config.license_key = "**********************"\n\n  ## Use Rails credentials:\n  ## doc: https://edgeguides.rubyonrails.org/security.html#custom-credentials\n  # config.license_key = Rails.application.credentials.adminterface[:license_key]\n\n  ## Or, use environment variables:\n  # config.license_key = ENV["ADMINTERFACE_LICENSE_KEY"]\nend\n')),(0,r.kt)("h2",{id:"license-verification"},"License verification"),(0,r.kt)("p",null,"When the application initializes, it pings our server with some information about the current Adminterface installation.\nThe server will respond with a license valid/invalid back to your application."),(0,r.kt)("div",{className:"admonition admonition-info alert alert--info"},(0,r.kt)("div",{parentName:"div",className:"admonition-heading"},(0,r.kt)("h5",{parentName:"div"},(0,r.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,r.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"14",height:"16",viewBox:"0 0 14 16"},(0,r.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"}))),"info")),(0,r.kt)("div",{parentName:"div",className:"admonition-content"},(0,r.kt)("p",{parentName:"div"},"The application will only send the request when it first initializes, so it will not impact your application's performance."),(0,r.kt)("p",{parentName:"div"},"Furthermore, when the verification fails, it won't crash your application, but you will receive a friendly reminder from us."))),(0,r.kt)("p",null,"You can find the full payload below:"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-ruby"},"{\n  license_key: license_key, # Your license key\n  license: license, # e.g., personal, commerical\n  adminterface_version: Adminterface::VERSION,\n  rails_version: Rails::VERSION::STRING,\n  ruby_version: RUBY_VERSION,\n  environment: Rails.env,\n  app_name: app_name, # e.g., MyAwesomeProject\n}\n")))}m.isMDXComponent=!0}}]);