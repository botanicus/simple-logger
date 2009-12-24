# encoding: utf-8

require_relative "plain"

module SimpleLogger
  class Logger < Plain
    @@colors = {
      fatal:  :red,
      error:  :red,
      warn:   :yellow,
      info:   :white,
      debug:  :cyan,
      custom: :magenta
    }

    @@color_values = {
      black:   30,
      red:     31,
      green:   32,
      yellow:  33,
      blue:    34,
      magenta: 35,
      cyan:    36,
      white:   37
    }
    
    # Generate the logging methods for SimpleLogger.logger for each log level.
    self::Levels.each_pair do |name, number|
      color = @@color_values[@@colors[name]]
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
        self << "\033[0;\#{#{color}}m%s\033[0m" % message
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
        self << "\033[0;\#{#{color}}m%s\033[0m" % message
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
