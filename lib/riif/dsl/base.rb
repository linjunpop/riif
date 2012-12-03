module Riif::DSL
  class Base

    def initialize
      @rows = []
      @current_row = []
      @start_column = self.class::START_COLUMN
      @end_column = self.class::END_COLUMN
    end

    def build(&block)

      instance_eval(&block)

      output
    end

    def row(&block)
      @current_row = [@start_column]

      instance_eval(&block)

      @rows << @current_row
    end

    def output
      raise 'Does not implement method: output'
    end

    def method_missing(method_name, *args, &block)
      if self.class::HEADER_COLUMNS.include?(method_name)
        @current_row[self.class::HEADER_COLUMNS.index(method_name) + 1] = args[0]
      else
        super
      end
    end
  end
end
