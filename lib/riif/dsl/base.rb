module Riif::DSL
  class Base
    @rows = []
    @current_row = []

    def header_columns
    end

    def start_column
    end

    def end_column
    end

    def build(&block)

      instance_eval(&block)

      output
    end

    def output
      CSV.generate(col_sep: "\t") do |tsv|
        tsv << ["!#{@start}"].concat(@rows)
        tsv << ["!#{@end}"]
        tsv << @rows
      end
    end

    def row(&block)
      @current_row = [@start]

      instance_eval(&block)

      @rows << (@current_row << "\n")
    end

    def method_missing(method_name, *args, &block)
      if header_columns.include?(method_name)
        @current_row[header_columns.index(method_name) + 1] = args[0]
      else
        super
      end
    end
  end
end
