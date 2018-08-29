# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "to_nouns/version"

Gem::Specification.new do |spec|
  spec.name          = "to_nouns"
  spec.version       = ToNouns::VERSION
  spec.authors       = ["Yosuke Kabuto"]
  spec.email         = ["bluewhale1982@gmail.com"]

  spec.summary       = %q{Retrieving nouns from self.}
  spec.description   = %q{Using MeCab for Retrieving nouns from self.}
  spec.homepage      = "https://github.com/ysksn/to_nouns"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.4.0"

  spec.add_runtime_dependency "natto"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
end
