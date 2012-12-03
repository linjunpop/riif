require 'csv'
require 'riif/dsl/base'
require 'riif/dsl/trns'
require 'riif/dsl/spl'
require 'riif/dsl/cust'
require 'riif/dsl/emp'

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
