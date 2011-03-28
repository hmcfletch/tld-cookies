# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tld-cookies/version"

Gem::Specification.new do |s|
  s.name        = "tld-cookies"
  s.version     = Tld::Cookies::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Les Fletcher"]
  s.email       = ["les.fletcher@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Top Level Domain cookies for Rails 3}
  s.description = %q{Add a TLD cookie jar for Rails 3 that can be chained with permanent and signed cookies}

  s.rubyforge_project = "tld-cookies"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.has_rdoc = true

  s.add_dependency('rails', '~> 3.0.0')
end
