// Load Active Admin's styles into Webpacker,
// see `active_admin.scss` for customization.
import '../stylesheets/active_admin'
import '../../../../../app/javascript/adminterface/base'

import Rails from '@rails/ujs'

require('@rails/activestorage').start()
require('trix')
require('@rails/actiontext')

Rails.start()
