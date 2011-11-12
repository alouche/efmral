#:nopkg:
ENV["RUBYLIB"] = "#{File.dirname(__FILE__)}/lib"
ENV["RUBYOPT"] = "-rubygems"
#:

require 'rake/testtask'

def spec
  @spec ||= Gem::Specification.load("efmral.gemspec")
end

desc "Starting #{spec.name} v#{spec.version}"
task :start do
  sh "thin -C config.yml start"
end

desc "Stopping  #{spec.name} v#{spec.version}"
task :stop do
  sh "thin -C config.yml stop"
end

task :default => :start
