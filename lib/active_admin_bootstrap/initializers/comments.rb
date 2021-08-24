module ActiveAdminBootstrap
  module Initializers
    module Comments
      extend ActiveSupport::Concern

      included do
        config.before_configuration do |_app|
          require_relative("../extensions/orm/active_record/comments/views/active_admin_comments")
        end
      end
    end
  end
end
