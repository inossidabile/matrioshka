module Matrioshka
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def install
        template "matrioshka.rake", "lib/tasks/matrioshka.rake"
        template "engine.rb", "lib/#{application.underscore}.rb"
        template "init.rb", "init.rb"

        %w(
          config.ru
          Rakefile
          config/environment.rb
          config/routes.rb
          config/environments/development.rb
          config/environments/production.rb
          config/environments/test.rb
          config/initializers/secret_token.rb
          config/initializers/session_store.rb
        ).each do |f|
          if File.exists?(Rails.root.join f)
            gsub_explicit_application_name f
          end
        end
      end

    protected

      def gsub_explicit_application_name(file)
        gsub_file file, Rails.application.class.name, 'Rails.application.class'
      end

      def application
        @application ||= Rails.application.class.name.deconstantize
      end

    end
  end
end