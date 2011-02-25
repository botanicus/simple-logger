#!/usr/bin/env gem build
# encoding: utf-8

require "base64"

# NOTE: we can't use require_relative because when we run gem build, it use eval for executing this file
Gem::Specification.new do |s|
  s.name = "simple-logger"
  s.version = "0.1"
  s.authors = ["Jakub Šťastný aka Botanicus"]
  s.homepage = "http://github.com/botanicus/simple-logger"
  s.summary = "Logger with colours support."
  s.description = "Smarter clone of Extlib logger with colours support."
  s.cert_chain = nil
  s.email = Base64.decode64("c3Rhc3RueUAxMDFpZGVhcy5jeg==\n")
  s.has_rdoc = true
  s.rubyforge_project = "simple-logger"

  # files
  s.files = `git ls-files`.split("\n")

  s.require_paths = ["lib"]

  # Ruby version
  s.required_ruby_version = ::Gem::Requirement.new("~> 1.9")

  # dependencies
  s.add_dependency "term-ansicolor"
end
