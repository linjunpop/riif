module Riif::DSL
  class Othername < Base
    HEADER_COLUMNS = [
      :name,
      :baddr1,
      :baddr2,
      :baddr3,
      :baddr4,
      :baddr5,
      :phone1,
      :phone2,
      :faxnum,
      :cont1,
      :notepad,
      :salutation,
      :companyname,
      :firstname,
      :midinit,
      :lastname,
      :note
    ]
    START_COLUMN = 'OTHERNAME'
    END_COLUMN = ''
  end
end
