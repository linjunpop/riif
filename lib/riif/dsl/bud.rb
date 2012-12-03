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
    START_COLUMN = 'ACCNT'
    END_COLUMN = ''
  end
end
