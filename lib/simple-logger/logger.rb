# encoding: utf-8

begin
  require "term/ansicolor"
rescue LoadError
  raise LoadError, "You have to install term-ansicolor gem!"
end

require_relative "plain"

module SimpleLogger
  class Logger < Plain
    def self.colors
      @@colors ||= {
        fatal:  "red.bold",
        error:  "red",
        warn:   "yellow",
        info:   "green",
        debug:  "cyan",
        custom: "magenta"
      }
    end

    # Generate the logging methods for SimpleLogger.logger for each log level.
    self::Levels.each_pair do |name, number|
      color = self.colors[name]
      class_eval <<-RUBY, __FILE__, __LINE__

      # Appends a message to the log if the log level is at least as high as
      # the log level of the logger.
      #
      # ==== Parameters
      # string<String>:: The message to be logged. Defaults to nil.
      #
      # ==== Returns
      # self:: The logger object for chaining.
      def #{name}(message = nil)
        self << message.extend(Term::ANSIColor).#{color}
        self
      end

      # Appends a message to the log if the log level is at least as high as
      # the log level of the logger. The bang! version of the method also auto
      # flushes the log buffer to disk.
      #
      # ==== Parameters
      # string<String>:: The message to be logged. Defaults to nil.
      #
      # ==== Returns
      # self:: The logger object for chaining.
      def #{name}!(message = nil)
        self << message.extend(Term::ANSIColor).#{color}
        flush if #{number} >= level
        self
      end

      # ==== Returns
      # Boolean:: True if this level will be logged by this logger.
      def #{name}?
        #{number} >= level
      end
      RUBY
    end
  end
end
