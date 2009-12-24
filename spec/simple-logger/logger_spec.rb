# encoding: utf-8

require "spec"
require "tempfile"
require_relative "../lib/simple-logger"

describe SimpleLogger::Logger do
  before(:each) do
    @stream = Tempfile.new("test.log")
    @logger = SimpleLogger::Logger.new(@stream)
  end

  it "should have some specs"
end
