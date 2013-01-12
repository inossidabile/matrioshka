lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require '<%= application.underscore %>'

Gem::Specification.new do |gem|
  gem.name          = '<%= application.underscore.gsub('/', '-') %>'
  gem.version       = <%= application %>::VERSION
  gem.authors       = ['']
  gem.email         = ['']
  gem.description   = %q{Write a gem description}
  gem.summary       = %q{Write a gem summary}
  gem.homepage      = ''
  gem.files         = `git ls-files`.split($/)

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'matrioshka', '>= 0.1.0'

  gem.post_install_message = "Please run `rake <%= application.underscore.gsub('/', '_') %>:link` to finish the installation."
end