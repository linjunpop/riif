module Riif::DSL
  class Timeact < Base
    HEADER_COLUMNS = [
      :date,
      :job,
      :emp,
      :item,
      :pitem,
      :duration,
      :proj,
      :note,
      :billingstatus
    ]
    START_COLUMN = 'TIMEACT'
    END_COLUMN = ''
  end
end
