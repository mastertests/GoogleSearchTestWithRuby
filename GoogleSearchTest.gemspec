lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'GoogleSearchTest/version'

Gem::Specification.new do |spec|
  spec.name = 'GoogleSearchTest'
  spec.version = GoogleSearchTest::VERSION
  spec.authors = ['Nazar']
  spec.email = ['nazar.potykan@gmail.com']

  spec.summary = 'Simple test google search'

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0.a'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
