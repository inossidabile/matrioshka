require 'matrioshka'

namespace '<%= application.underscore.gsub('/', '_') %>' do
  task :link do
    generator = Matrioshka::Generator.new
    location  = File.expand_path File.join(*['..']*3), __FILE__

    if location == Rails.root.to_s
      puts "This task was successfully registered. Call it from the gem consumer not from the gem itself."
    else
      generator.copy_gemfile_from location, '<%= application %>' 
      generator.prepend_seeds '<%= application %>'
      generator.run "bundle install"
    end
  end
end