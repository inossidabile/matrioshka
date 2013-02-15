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
      aa_load_path = << <%= application %>::Engine.root.join('app/admin').to_s
      ActiveAdmin.application.load_paths << aa_load_path
      config.eager_load_paths.reject!{|x| x == aa_load_path}
      <% end %>
    end
  end
end
