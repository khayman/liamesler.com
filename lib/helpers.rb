module Sinatra
  module RenderPartial
    def partial(page, options={})
      haml page, options.merge!(:layout => false)
    end
  end

  module Navigation
    def current_page?(path='')
      request.path_info.include?(path) ? 'current' : nil
    end
  end

  helpers RenderPartial
  helpers Navigation
end
