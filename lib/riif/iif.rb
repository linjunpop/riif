require 'csv'
require_relative 'dsl/base'
require_relative 'dsl/trns'
require_relative 'dsl/spl'

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
