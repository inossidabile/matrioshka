require 'rails/engine'

module <%= application %>
  VERSION = '0.0.1'

  class Engine < ::Rails::Engine
    initializer 'matrioshka', :before => :set_autoload_paths do |app|
      app.class.configure do
        config.i18n.load_path += Dir[<%= application %>::Engine.root.join(*%w(config locales *.{rb,yml})).to_s]
        config.autoload_paths += %W(#{<%= application %>::Engine.root.join 'lib'})
        config.paths['db/migrate'] += <%= application %>::Engine.paths['db/migrate'].existent
      end
    end
  end
end
