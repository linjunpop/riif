module Riif::DSL
  class Trns

    def initialize
      @rows = []
      @current_row = []
      @start_column = 'TRNS'
      @end_column = 'ENDTRNS'
      @header_columns = [
        :trnsid,
        :trnstype,
        :date,
        :accnt,
        :name,
        :class,
        :amount,
        :docnum,
        :memo,
        :clear,
        :toprint,
        :addr1,
        :addr2,
        :addr3,
        :addr4,
        :addr5,
        :duedate,
        :terms,
        :paid,
        :shipdate
      ]
    end

    def build(&block)

      instance_eval(&block)

      output
    end

    def output
      CSV.generate(col_sep: "\t") do |tsv|
        tsv << ["!#{@start_column}"].concat(@header_columns)
        tsv << ["!#{@end_column}"]
        @rows.each do |row|
          tsv << row
        end
      end
    end

    def row(&block)
      @current_row = [@start_column]

      instance_eval(&block)

      @rows << @current_row
      @rows << [@end_column]
    end

    def spl(&block)
      @current_row = SPL.new.build(&block)

      @rows << @current_row
    end

    def method_missing(method_name, *args, &block)
      if @header_columns.include?(method_name)
        @current_row[@header_columns.index(method_name) + 1] = args[0]
      else
        super
      end
    end
  end
end
