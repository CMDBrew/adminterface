// Load ActiveAdminBootstrap styles into Webpacker,
// see `active_admin_bootstrap.scss` for customization.
import '../stylesheets/active_admin'

import Rails from '@rails/ujs'
import '@cmdbrew/active_admin_bootstrap'

require('@rails/activestorage').start()
require('trix')
require('@rails/actiontext')

Rails.start()
