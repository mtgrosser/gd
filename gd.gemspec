# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'gd/version'

Gem::Specification.new do |s|
  s.name        = 'gd'
  s.version     = GD::VERSION
  s.date        = '2014-11-27'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Matthias Grosser']
  s.email       = ['mtgrosser@gmx.net']
  s.homepage    = 'http://github.com/mtgrosser/gd'
  s.licenses    = ['MIT']
  s.summary     = %q{Ruby bindings for the GD2 image manipulation library}
  s.description = %q{MIT-licensed Ruby bindings for GD2}
  s.required_ruby_version = '>= 2.0'

  s.files         = Dir['{lib}/**/*.rb', 'MIT-LICENSE', 'README.md', 'CHANGELOG', 'Rakefile']
  s.require_paths = ['lib']
  
  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'minitest', '>= 5.0'
end

