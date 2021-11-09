# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [0.2.3](https://github.com/CMDBrew/adminterface/compare/v0.2.2...v0.2.3) (2021-11-09)


#### Build

* **deps:** bump @popperjs/core to v2.10.2 ([f7cb681](https://github.com/CMDBrew/adminterface/commit/f7cb681cd744e83b0702b732acd58b00a63ccc0a))

### [0.2.2](https://github.com/CMDBrew/adminterface/compare/v0.2.1...v0.2.2) (2021-11-03)


#### Bug Fixes

* add "aria-current": "page" to active nav link ([6cbc538](https://github.com/CMDBrew/adminterface/commit/6cbc538efeee86138450c1cc1aef491bf725a8d8))
* add aria attrs to tabs ([547807b](https://github.com/CMDBrew/adminterface/commit/547807b034bddb1079380729ec5e2209ee409b5c))
* add aria-expanded to navbar-toggler ([a94ffff](https://github.com/CMDBrew/adminterface/commit/a94ffff50ea0f4d7b50bff0881b04aabadc8dfe9))
* add role and aria-expanded to dropdowns ([835d6c6](https://github.com/CMDBrew/adminterface/commit/835d6c62c049385d6526f0b69d18f561291bd3b1))
* add role to alerts ([dc00596](https://github.com/CMDBrew/adminterface/commit/dc00596ae998c210af89c442c794bbda0d85b3e2))
* http tabs render incorrect url ([3006185](https://github.com/CMDBrew/adminterface/commit/300618546abb199b30e4906da8ad6cf8695a2a9f))
* remove user-scalable="no" from meta ([bda3b2f](https://github.com/CMDBrew/adminterface/commit/bda3b2fea20de05438f50aa3012529a0feac4792))
* bump Bootstrap to v5.1.3 to address sass parser issues when compiling. See [twbs/bootstrap#35011](https://github.com/twbs/bootstrap/issues/35011) ([46fc25d](https://github.com/CMDBrew/adminterface/commit/46fc25d4682fdf3eb662084d76b4e4360d1913fa))

### [0.2.1](https://github.com/CMDBrew/adminterface/compare/v0.2.0...v0.2.1) (2021-10-29)


#### Bug Fixes

* fallback value for JSON.parse should be '{}' instead of {} ([727a2ba](https://github.com/CMDBrew/adminterface/commit/727a2bab65145a06428d35408861ad680c08cccd))
* missing thor class for invoke when installing action_text ([e749441](https://github.com/CMDBrew/adminterface/commit/e749441cc9929307899247d09eff3d46943c180f))
* install_generator options should be consistent with activeadmin ([5a36c01](https://github.com/CMDBrew/adminterface/commit/5a36c01a4f1505476a125c1a085c8864665012c8))

## [0.2.0](https://github.com/CMDBrew/adminterface/compare/v0.1.0...v0.2.0) (2021-10-15)


### Features

* add license checker ([e9f114f](https://github.com/CMDBrew/adminterface/commit/e9f114f3a298185c66541392ba8eacaa5addb20d))
* license_key encryption ([081e90a](https://github.com/CMDBrew/adminterface/commit/081e90a549263db213fa4fdfb607df57649ceb07))


### Bug Fixes

* only check license when starting rails server ([5b47829](https://github.com/CMDBrew/adminterface/commit/5b478298d28f301e501e8ffaafca40e8c8080b56))

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

* add comments generator ([2fae11e](https://github.com/CMDBrew/adminterface/commit/2fae11e8b2792d3ce20074bf59eb5fc240eb34ea))
* add groupish to js inputs ([d2736c0](https://github.com/CMDBrew/adminterface/commit/d2736c0da1ce8b41c5291a32ef77bc4b995f9679))
* add popover and tooltip ([7f5f7b9](https://github.com/CMDBrew/adminterface/commit/7f5f7b91957d66e57365c1712c30bc3c698ceda4))
* add show password toggler for password input ([d5bb1dd](https://github.com/CMDBrew/adminterface/commit/d5bb1dd815f07e10fa688e3b168a40cd3306fc30))
* allow changing JS input mapping and adding custom input types ([a3e8895](https://github.com/CMDBrew/adminterface/commit/a3e8895cf03fe1f727cd1a3e918f5c83c1226704))
* allow different styles for index_as_table dropdown and buttons ([84ad8d5](https://github.com/CMDBrew/adminterface/commit/84ad8d51c35c0a1eff080d4f0d5440f478c05c42))
* change how js plugins are defined inside components.yml ([944dbbb](https://github.com/CMDBrew/adminterface/commit/944dbbb5caed170c38b838c6d482bab82eadd603))
* enhance ActiveAdmin::Comments ([38adb17](https://github.com/CMDBrew/adminterface/commit/38adb175c6879bc81571f83fb2702452765e729d))
* applied Bootstrap 5 to ActiveAdmin
* ability to configure CSS classes and components via configuration files
* add support for all Formtastic input types
* enhance Arbre components
* rewrite ActiveAdmin Javascript in es6 and remove jQuery

### Bug Fixes

* add temp fix for active_admin_comments author validation ([d93b20f](https://github.com/CMDBrew/adminterface/commit/d93b20f2ebdc22642a8b4c14bc1924c6eedf1ca4))
* component configs path key for pluginish and datepicker alis for date_picker ([8cbd770](https://github.com/CMDBrew/adminterface/commit/8cbd77060f8569fe04a4e967274b9528f0dc03f1))
* confirm dialog configs should inherit from backend configs ([a5377d8](https://github.com/CMDBrew/adminterface/commit/a5377d8257037f1b345c49b7b97e852bb971a48b))
* fix `f.semantic_errors` returning empty alert even if there are no errors ([f1cb91e](https://github.com/CMDBrew/adminterface/commit/f1cb91e4d03f0b4597aba9e4922ede0d8ac0e60d))
* fix dropdown cutoff when overflowing ([5f3475a](https://github.com/CMDBrew/adminterface/commit/5f3475a7710214e682217dea430fe805f1e950f3))
* fix field_error_proc breaking input group styles ([ce33cd9](https://github.com/CMDBrew/adminterface/commit/ce33cd97aad62e9bca16242e00db1fb66bda4deb))
* fix has_many_delete styling ([75300db](https://github.com/CMDBrew/adminterface/commit/75300db021371bcad5c5e6dc0635e1003c40ea55))
* fix password input visibility toggler style ([c47ed10](https://github.com/CMDBrew/adminterface/commit/c47ed101dde2c4b5d8585e7f070edb9569f1d122))
* fix printing stylesheets and add print template for webpacker generator ([ec57890](https://github.com/CMDBrew/adminterface/commit/ec5789015050cc4dd2e1ecba5a7421ce526db36e))
* fix zeitwerk autoloading constant deprecation ([e9a8797](https://github.com/CMDBrew/adminterface/commit/e9a879778346228b8cef2bd671ffe45d51291c6a))
* remove adminterface from license dependencies and fix licenses task ([3989817](https://github.com/CMDBrew/adminterface/commit/3989817b0f677850d779b30afe297f750b318026))
* remove flaky plugin for tom_select ([8bdedc7](https://github.com/CMDBrew/adminterface/commit/8bdedc7bd202e6db5ed16edbca4948cad3710aee))
* remove unused site_title_image_logged_out ([5376bd7](https://github.com/CMDBrew/adminterface/commit/5376bd70819b390db2cca32c9256176bb513e64b))
* sass slash as division ([4ef37c0](https://github.com/CMDBrew/adminterface/commit/4ef37c0a9bdd1882ca2ee745fab76a8e7e0794f2))
* set altInput for flatpickr and update examples in docs ([0f0ba49](https://github.com/CMDBrew/adminterface/commit/0f0ba497fcec95fbb2d9710c4954f647139beea9))
* update default css_classes ([151b5e1](https://github.com/CMDBrew/adminterface/commit/151b5e1e34fc4cc62c4117e6a02349f72f366174))
* wrong dataset `observerUuid` should be `observerId` for _getPristineObservers ([6772649](https://github.com/CMDBrew/adminterface/commit/67726495c279abe502a302e9568ab5b3d9fd66f1))
