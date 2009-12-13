begin
  require "extlib/logger"
rescue LoadError
  raise LoadError, "You need to have extlib installed"
end

module Extlib
  module ColorfulLogger
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

    def self.extended(base)
      metaclass = (class << base; self; end)
      metaclass::Levels.each_pair do |name, number|
        color = @@color_values[@@colors[name]]
        class_eval <<-RUBY, __FILE__, __LINE__

        def #{name}(message = nil)
          if #{number} >= level
            message = block_given? ? yield : message
            self << "\033[0;\#{#{color}}m%s\033[0m" % message
          end
          self
        end

        def #{name}!(message = nil)
          if #{number} >= level
            message = block_given? ? yield : message
            self << "\033[0;\#{#{color}}m%s\033[0m" % message
            flush
          end
          self
        end
        RUBY
      end
    end
  end
end
