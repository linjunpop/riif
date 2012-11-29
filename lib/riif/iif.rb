require 'csv'
require_relative 'dsl/trns'

module Riif
  class IIF
    def method_missing(method_name, *args, &block)
      eval("::Riif::DSL::#{method_name.capitalize}").new.build(&block)
    end
  end
end
