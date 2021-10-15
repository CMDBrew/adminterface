module Adminterface
  module Callable
    def call(*args, **kwargs, &block)
      new(*args, **kwargs).call(&block)
    end
  end
end
