# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'bundler/version'

Gem::Specification.new do |s|
  s.name = "efmral"
  s.version = "0.1"
  s.platform = Gem::Platform::RUBY
  s.authors = ["Ali Abbas"]
  s.email = ["ali@alouche.net"]
  s.homepage = "http://github.com/alouche/efmral"
  s.summary = "efmral - sharing secrets has never been easier and secure"
  s.description = "Efmral is a simple sinatra application which allows temporary crypted shared information, which self-destruct on single view"
  s.files = Dir.glob("lib/**/*") + %w(LICENCE COPYING README.mdk Rakefile config.ru config.yml)
  s.require_path = 'lib'
  s.add_dependency "sinatra", ">= 1.0"
  s.add_dependency "thin"
  s.add_dependency "haml"
  s.add_dependency "data_mapper"
  s.add_dependency "data_objects"
  s.add_dependency "do_sqlite3"
  s.add_dependency "dm-sqlite-adapter"
end
