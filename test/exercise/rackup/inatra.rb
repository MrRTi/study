module Inatra
  class << self
    def method_missing(method_name, *args, &block)
      if method_name.to_s =~ /get/
        @get_path ||= {}
        @get_path[args.first.to_s] = block
      elsif method_name.to_s =~ /post/
        @post_path ||= {}
        @post_path[args.first.to_s] = block
      else
        super
      end
    end

    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      path = env['PATH_INFO']
      if env['REQUEST_METHOD'] == 'GET'
        block = @get_path[path]
      elsif env['REQUEST_METHOD'] == 'POST'
        block = @post_path[path]
      else
        puts 'ERROR REQUEST METHOD NOT FOUND'
        return 'ERROR'
      end
      block.call(env)
    end
  end
end
