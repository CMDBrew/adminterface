# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [0.2.0](https://github.com/CMDBrew/adminterface/compare/v0.1.0...v0.2.0) (2021-10-15)


### Features

* add license checker ([e9f114f](https://github.com/CMDBrew/adminterface/commits/e9f114f3a298185c66541392ba8eacaa5addb20d))
* license_key encryption ([081e90a](https://github.com/CMDBrew/adminterface/commits/081e90a549263db213fa4fdfb607df57649ceb07))


### Bug Fixes

* only check license when starting rails server ([5b47829](https://github.com/CMDBrew/adminterface/commits/5b478298d28f301e501e8ffaafca40e8c8080b56))

## 0.1.0 (2021-09-25)


### ⚠ BREAKING CHANGES

* the way you config js plugins inside components.yml has changed.
* the class name is changed from `Dropdown` to `DetachedDropdown`
To use the dropdown class in your code, you will need to import it like this:
```javascript
import { DetachedDropdown } from '@cmdbrew/adminterface'
```
* the latest ActiveAdmin has combined print.scss into the main file— https://github.com/activeadmin/activeadmin/pull/6922/commits/14b64cdf946449091a467ea22adbafd88782b614

### Features

* add comments generator ([2fae11e](https://github.com/CMDBrew/adminterface/commits/2fae11e8b2792d3ce20074bf59eb5fc240eb34ea))
* add groupish to js inputs ([d2736c0](https://github.com/CMDBrew/adminterface/commits/d2736c0da1ce8b41c5291a32ef77bc4b995f9679))
* add popover and tooltip ([7f5f7b9](https://github.com/CMDBrew/adminterface/commits/7f5f7b91957d66e57365c1712c30bc3c698ceda4))
* add show password toggler for password input ([d5bb1dd](https://github.com/CMDBrew/adminterface/commits/d5bb1dd815f07e10fa688e3b168a40cd3306fc30))
* allow changing JS input mapping and adding custom input types ([a3e8895](https://github.com/CMDBrew/adminterface/commits/a3e8895cf03fe1f727cd1a3e918f5c83c1226704))
* allow different styles for index_as_table dropdown and buttons ([84ad8d5](https://github.com/CMDBrew/adminterface/commits/84ad8d51c35c0a1eff080d4f0d5440f478c05c42))
* change how js plugins are defined inside components.yml ([944dbbb](https://github.com/CMDBrew/adminterface/commits/944dbbb5caed170c38b838c6d482bab82eadd603))
* enhance ActiveAdmin::Comments ([38adb17](https://github.com/CMDBrew/adminterface/commits/38adb175c6879bc81571f83fb2702452765e729d))
* applied Bootstrap 5 to ActiveAdmin
* ability to configure CSS classes and components via configuration files
* add support for all Formtastic input types
* enhance Arbre components
* rewrite ActiveAdmin Javascript in es6 and remove jQuery

### Bug Fixes

* add temp fix for active_admin_comments author validation ([d93b20f](https://github.com/CMDBrew/adminterface/commits/d93b20f2ebdc22642a8b4c14bc1924c6eedf1ca4))
* component configs path key for pluginish and datepicker alis for date_picker ([8cbd770](https://github.com/CMDBrew/adminterface/commits/8cbd77060f8569fe04a4e967274b9528f0dc03f1))
* confirm dialog configs should inherit from backend configs ([a5377d8](https://github.com/CMDBrew/adminterface/commits/a5377d8257037f1b345c49b7b97e852bb971a48b))
* fix `f.semantic_errors` returning empty alert even if there are no errors ([f1cb91e](https://github.com/CMDBrew/adminterface/commits/f1cb91e4d03f0b4597aba9e4922ede0d8ac0e60d))
* fix dropdown cutoff when overflowing ([5f3475a](https://github.com/CMDBrew/adminterface/commits/5f3475a7710214e682217dea430fe805f1e950f3))
* fix field_error_proc breaking input group styles ([ce33cd9](https://github.com/CMDBrew/adminterface/commits/ce33cd97aad62e9bca16242e00db1fb66bda4deb))
* fix has_many_delete styling ([75300db](https://github.com/CMDBrew/adminterface/commits/75300db021371bcad5c5e6dc0635e1003c40ea55))
* fix password input visibility toggler style ([c47ed10](https://github.com/CMDBrew/adminterface/commits/c47ed101dde2c4b5d8585e7f070edb9569f1d122))
* fix printing stylesheets and add print template for webpacker generator ([ec57890](https://github.com/CMDBrew/adminterface/commits/ec5789015050cc4dd2e1ecba5a7421ce526db36e))
* fix zeitwerk autoloading constant deprecation ([e9a8797](https://github.com/CMDBrew/adminterface/commits/e9a879778346228b8cef2bd671ffe45d51291c6a))
* remove adminterface from license dependencies and fix licenses task ([3989817](https://github.com/CMDBrew/adminterface/commits/3989817b0f677850d779b30afe297f750b318026))
* remove flaky plugin for tom_select ([8bdedc7](https://github.com/CMDBrew/adminterface/commits/8bdedc7bd202e6db5ed16edbca4948cad3710aee))
* remove unused site_title_image_logged_out ([5376bd7](https://github.com/CMDBrew/adminterface/commits/5376bd70819b390db2cca32c9256176bb513e64b))
* sass slash as division ([4ef37c0](https://github.com/CMDBrew/adminterface/commits/4ef37c0a9bdd1882ca2ee745fab76a8e7e0794f2))
* set altInput for flatpickr and update examples in docs ([0f0ba49](https://github.com/CMDBrew/adminterface/commits/0f0ba497fcec95fbb2d9710c4954f647139beea9))
* update default css_classes ([151b5e1](https://github.com/CMDBrew/adminterface/commits/151b5e1e34fc4cc62c4117e6a02349f72f366174))
* wrong dataset `observerUuid` should be `observerId` for _getPristineObservers ([6772649](https://github.com/CMDBrew/adminterface/commits/67726495c279abe502a302e9568ab5b3d9fd66f1))
