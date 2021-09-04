// Load Adminterface styles into Webpacker,
// see `adminterface.scss` for customization.
import '../stylesheets/active_admin'

import Rails from '@rails/ujs'
import '@cmdbrew/adminterface'

require('@rails/activestorage').start()
require('trix')
require('@rails/actiontext')

Rails.start()
