module Adminterface
  module ActionTextComment
    extend ActiveSupport::Concern

    included do
      # Fix author validation issue— https://github.com/activeadmin/activeadmin/issues/5258
      _validate_callbacks.each do |callback|
        callback.raw_filter.attributes.delete :author
      end

      has_rich_text :body
    end
  end
end

Rails.configuration.to_prepare do
  ActiveAdmin::Comment.send :include, Adminterface::ActionTextComment
end
