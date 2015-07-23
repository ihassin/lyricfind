# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lyricfind/version'

Gem::Specification.new do |spec|
  spec.name          = "LyricFind"
  spec.version       = LyricFind::VERSION
  spec.authors       = ["Itamar Hassin"]
  spec.email         = ["ihassin@mac.com"]

  spec.summary       = %q{Access LyricFind's API}
  spec.description   = %q{This gem will allow your application to access LyricFind's API}
  spec.homepage      = "https://github.com/ihassin/lyricfind"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
#    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_runtime_dependency "nokogiri"

end
