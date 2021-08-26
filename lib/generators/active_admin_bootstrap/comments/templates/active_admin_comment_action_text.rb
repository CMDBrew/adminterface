module ActiveAdminBootstrap
  module ActionTextComment
    extend ActiveSupport::Concern

    included do
      has_rich_text :body
    end
  end
end

Rails.configuration.to_prepare do
  ActiveAdmin::Comment.send :include, ActiveAdminBootstrap::ActionTextComment
end
