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
      :duedate,
      :terms,
      :paid,
      :shipdate
    ]
    START_COLUMN = 'TRNS'
    END_COLUMN = 'ENDTRNS'

    def output
      {
        headers: [
          ["!#{@start_column}"].concat(HEADER_COLUMNS.map(&:upcase)),
          ["!SPL"].concat(Spl::HEADER_COLUMNS.map(&:upcase)),
          ["!#{@end_column}"]
        ],
          rows: @rows << [@end_column]
      }
    end

    def spl(&block)
      Spl.new.build(&block)[:rows].each do |row|
        @rows << row
      end
    end
  end
end
