# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pretty_param/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kyle Meyer"]
  gem.email         = ["kaiuhl@kittelson.com"]
  gem.description   = %q{Search-engine friendly URLs for your models}
  gem.summary       = %q{Search-engine friendly URLs for your models}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "pretty_param"
  gem.require_paths = ["lib"]
  gem.version       = PrettyParam::VERSION

	gem.add_development_dependency "rspec"
end
