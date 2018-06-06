module Inatra
  class << self
    def get(path, &block)
      @income = {}
      @income[path] = block
    end

    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      path = env['PATH_INFO']
      block = @income[path]
      block.call(env)
    end
  end
end
