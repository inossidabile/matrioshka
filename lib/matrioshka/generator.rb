module Matrioshka
  class Generator < Rails::Generators::Base
    source_root '.'

    def copy_gemfile_from(location, name)
      copy_file Pathname.new(location).join('Gemfile'), "Gemfile.#{name.underscore.gsub('/', '-')}"
      prepend_gemfile name
    end

    def prepend_gemfile(name)
      prepend_file 'Gemfile', "eval_gemfile 'Gemfile.#{name.underscore.gsub('/', '-')}'\n"
    end

    def prepend_seeds(name)
      prepend_file 'db/seeds.rb', "load #{name}::Engine.root.join(*%w(db seeds.rb))\n"
    end
  end
end