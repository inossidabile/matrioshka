require 'rails/engine'

module <%= application %>
  VERSION = '0.0.1'

  class Engine < ::Rails::Engine
    initializer 'matrioshka', :before => :set_autoload_paths do |app|

      # Rails
      app.class.configure do
        config.i18n.load_path += Dir[<%= application %>::Engine.root.join(*%w(config locales *.{rb,yml})).to_s]
        config.autoload_paths += %W(#{<%= application %>::Engine.root.join 'lib'})
        config.paths['db/migrate'] += <%= application %>::Engine.paths['db/migrate'].existent
      end

      <% if defined?(ActiveAdmin) %>
      # ActiveAdmin
      ActiveAdmin.setup do |config|
        config.load_paths << <%= application %>::Engine.root.join('app/admin')
      end
      <% end %>
    end
  end
end
