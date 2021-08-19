// Load Active Admin's styles into Webpacker,
// see `active_admin.scss` for customization.
import '../stylesheets/active_admin'
import '../../../../../app/javascript/active_admin_bootstrap/base'

import Rails from '@rails/ujs'

require('@rails/activestorage').start()
require('trix')
require('@rails/actiontext')

Rails.start()
