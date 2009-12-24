#!/usr/bin/env gem build
# encoding: utf-8

# NOTE: we can't use require_relative because when we run gem build, it use eval for executing this file
Gem::Specification.new do |s|
  s.name = "simple-logger"
  s.version = "0.0.1"
  s.authors = ["Jakub Šťastný aka Botanicus"]
  s.homepage = "http://github.com/botanicus/simple-logger"
  s.summary = "Smarter clone of Extlib logger"
  s.description = "" # TODO: long description
  s.cert_chain = nil
  s.email = ["knava.bestvinensis", "gmail.com"].join("@")
  s.has_rdoc = true

  # files
  s.files = Dir.glob("{lib,spec}/**/*") + %w[LICENSE Rakefile README.textile simple-logger.gemspec]
  s.require_paths = ["lib"]

  # Ruby version
  s.required_ruby_version = ::Gem::Requirement.new("~> 1.9")

  # dependencies
  s.add_dependency "extlib"
end
