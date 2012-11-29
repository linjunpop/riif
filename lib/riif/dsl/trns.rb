module Riif::DSL
  class Trns
    COLUMNS = [
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

    def build(&block)

      @columns = {}

      COLUMNS.each do |column|
        @columns[column] = nil
      end

      #instance_eval(&block)
      yield self

      output
    end

    def output
      CSV.generate(col_sep: "\t") do |tsv|
        tsv << ['!TRNS'].concat(COLUMNS)
        tsv << ['!ENDTRNS']
        tsv << ['TRNS'].concat(@columns.values)
      end
    end

    def method_missing(method_name, *args, &block)
      if COLUMNS.include?(method_name)
        @columns[method_name] = args[0]
      else
        super
      end
    end
  end
end
