module Riif::DSL
  class Timerhdr < Base
    HEADER_COLUMNS = [
      :ver,
      :rel,
      :companyname,
      :importedbefore,
      :fromtimer,
      :companycreatetime
    ]
    START_COLUMN = 'TIMERHDR'
    END_COLUMN = ''
  end
end
