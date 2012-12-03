module Riif::DSL
  class Spl
    HEADER_COLUMNS = [
      :splid,
      :trnstype,
      :date,
      :accnt,
      :name,
      :class,
      :amount,
      :docnum,
      :memo,
      :clear,
      :qnty,
      :price,
      :invitem,
      :paymeth,
      :taxable,
      :reimbexp,
      :extra
    ]

    def initialize
      @rows = []
      @current_row = []
      @start_column = 'SPL'
    end

    def build(&block)

      instance_eval(&block)

      output
    end

    def output
      {
        rows: @rows
      }
    end

    def row(&block)
      @current_row = [@start_column]

      instance_eval(&block)

      @rows << @current_row
      @rows << [@end_column]
    end

    def method_missing(method_name, *args, &block)
      if HEADER_COLUMNS.include?(method_name)
        @current_row[HEADER_COLUMNS.index(method_name) + 1] = args[0]
      else
        super
      end
    end
  end
end

