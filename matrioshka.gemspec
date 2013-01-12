# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matrioshka/version'

Gem::Specification.new do |gem|
  gem.name          = "matrioshka"
  gem.version       = Matrioshka::VERSION
  gem.authors       = ["Boris Staal"]
  gem.email         = ["boris@roundlake.ru"]
  gem.description   = %q{Turn your Rails 3 application into a gem}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/inossidabile/matrioshka"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
