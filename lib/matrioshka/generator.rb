module Matrioshka
  class Generator < Rails::Generators::Base
    source_root '.'

    def copy_gemfile_from(location, name)
      copy_file Pathname.new(location).join('Gemfile'), "Gemfile.#{name}"
      prepend_gemfile name

      inside Rails.root do
        run "bundle install"
      end
    end

    def prepend_gemfile(name)
      prepend_file 'Gemfile', "eval_gemfile 'Gemfile.#{name}'\n"
    end
  end
end