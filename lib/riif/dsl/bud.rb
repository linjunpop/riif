module Riif::DSL
  class Bud < Base
    HEADER_COLUMNS = [
      :accnt,
      :period,
      :amount,
      :startdate,
      :class,
      :customer
    ]
    START_COLUMN = 'BUD'
    END_COLUMN = ''
  end
end
