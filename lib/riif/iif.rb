require 'csv'

require 'riif/dsl/base'

require 'riif/dsl/accnt'
require 'riif/dsl/bud'
require 'riif/dsl/cust'
require 'riif/dsl/emp'
require 'riif/dsl/klass'
require 'riif/dsl/spl'
require 'riif/dsl/trns'

module Riif
  class IIF
    def method_missing(method_name, *args, &block)
      result = eval("::Riif::DSL::#{method_name.capitalize}").new.build(&block)

      CSV.generate(col_sep: "\t") do |tsv|
        result[:headers].each do |header|
          tsv << header
        end
        result[:rows].each do |row|
          tsv << row
        end
      end
    end
  end
end
