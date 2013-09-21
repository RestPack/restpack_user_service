# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'restpack_user_service/version'

Gem::Specification.new do |spec|
  spec.name          = "restpack_user_service"
  spec.version       = RestPack::User::Service::VERSION
  spec.authors       = ["Gavin Joyce"]
  spec.email         = ["gavinjoyce@gmail.com"]
  spec.description   = %q{Users and Authentications service}
  spec.summary       = %q{Users and Authentications}
  spec.homepage      = "https://github.com/RestPack"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "restpack_service"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "database_cleaner", "~> 1.0.1"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bump"
  spec.add_development_dependency "shoulda-matchers", "~> 1.4.2"
  spec.add_development_dependency "factory_girl", "~> 4.0"
end
