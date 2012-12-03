module Riif::DSL
  class Accnt < Base
    HEADER_COLUMNS = [
      :name,
      :accnttype,
      :obamount,
      :desc,
      :scd,
      :accnum,
      :extra
    ]
    START_COLUMN = 'ACCNT'
    END_COLUMN = ''
  end
end
