# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'banktools-br/version'

Gem::Specification.new do |spec|
  spec.name          = "banktools-br"
  spec.version       = Banktools::Br::VERSION
  spec.authors       = ["Noverde Team"]
  spec.email         = ["dev@noverde.com.br"]

  spec.summary       = %q{Gem to validate, normalize and prettify bank account numbers and agency from Brazil}
  spec.homepage      = "https://github.com/Noverde/banktools-br"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
