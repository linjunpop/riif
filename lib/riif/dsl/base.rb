module Riif::DSL
  class Base
    def initialize
      @rows = []
      @current_row = []
    end

    def build(&block)
      if block_given?
        if block.arity == 1
          yield(self)
        else
          instance_eval(&block)
        end
      end

      output
    end

    def row(&block)
      @current_row = [self.class::START_COLUMN]

      if block_given?
        if block.arity == 1
          yield(self)
        else
          instance_eval(&block)
        end
      end

      @rows << @current_row
    end

    def output
      {
        headers: headers,
        rows: rows
      }
    end

    def headers
      [
        ["!#{self.class::START_COLUMN}"].concat(
          self.class::HEADER_COLUMNS.map(&:upcase)
        )
      ]
    end

    def rows
      @rows
    end

    def method_missing(method_name, *args, &block)
      method_name = :class if method_name == :klass
      method_name = "1099".to_sym if method_name == :_1099

      if self.class::HEADER_COLUMNS.include?(method_name)
        @current_row[self.class::HEADER_COLUMNS.index(method_name) + 1] = args[0]
      else
        super
      end
    end
  end
end
