module Riif::DSL
  class Trns < Base
    HEADER_COLUMNS = [
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
      :saddr1,
      :saddr2,
      :saddr3,
      :saddr4,
      :saddr5,
      :duedate,
      :terms,
      :paid,
      :shipdate,
      :rep,
      :ponum,
      :invtitle,
      :invmemo
    ]
    START_COLUMN = 'TRNS'
    END_COLUMN = 'ENDTRNS'

    def headers
      [
        ["!#{START_COLUMN}"].concat(HEADER_COLUMNS.map(&:upcase)),
        ["!SPL"].concat(Spl::HEADER_COLUMNS.map(&:upcase)),
        ["!#{END_COLUMN}"]
      ]
    end

    def rows
      @rows << [END_COLUMN]
    end

    def spl(&block)
      Spl.new.build(&block)[:rows].each do |row|
        @rows << row
      end
    end
  end
end
