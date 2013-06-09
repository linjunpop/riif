require 'csv'

require 'riif/dsl/base'

require 'riif/dsl/accnt'
require 'riif/dsl/bud'
require 'riif/dsl/ctype'
require 'riif/dsl/cust'
require 'riif/dsl/emp'
require 'riif/dsl/invitem'
require 'riif/dsl/invmemo'
require 'riif/dsl/klass'
require 'riif/dsl/othername'
require 'riif/dsl/paymeth'
require 'riif/dsl/shipmeth'
require 'riif/dsl/spl'
require 'riif/dsl/terms'
require 'riif/dsl/timeact'
require 'riif/dsl/timerhdr'
require 'riif/dsl/trns'
require 'riif/dsl/vend'
require 'riif/dsl/vtype'

module Riif
  class IIF
    def initialize(&block)
      @output = {}
      if block_given?
        if block.arity == 1
          yield(self)
        else
          instance_eval(&block)
        end
      end
    end

    def output
      CSV.generate(col_sep: "\t") do |tsv|

        @output.each do |_, list|
          list[:headers].uniq.each do |header|
            tsv << header
          end
          list[:rows].each do |row|
            tsv << row
          end
        end
      end
    end

    def method_missing(method_name, *args, &block)
      result = eval("::Riif::DSL::#{method_name.capitalize}").new.build(&block)

      @output[method_name] ||= { headers: [], rows: [] }

      @output[method_name][:headers].concat(result[:headers])
      @output[method_name][:rows].concat(result[:rows])
    end
  end
end
