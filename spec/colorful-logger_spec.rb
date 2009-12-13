# encoding: utf-8

require "spec"
require "tempfile"
require_relative "../lib/colorful-logger"

describe Extlib::ColorfulLogger do
  before(:each) do
    @stream = Tempfile.new("test.log")
    @logger = Extlib::Logger.new(@stream)
  end

  it "should have some specs"
end
