module Riif::DSL
  class Terms < Base
    HEADER_COLUMNS = [
      :name,
      :duedays,
      :discper,
      :discdays,
      :termstype,
    ]
    START_COLUMN = 'TERMS'
    END_COLUMN = ''
  end
end
