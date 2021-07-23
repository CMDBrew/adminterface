module ActiveAdminBootstrap
  module Data
    class Base
      def self.call(*args)
        new(*args).call
      rescue => e
        {error: e.class.to_s, message: e.message}
      end
    end
  end
end
