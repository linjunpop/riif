module Riif::DSL
  class Emp < Base
    HEADER_COLUMNS = [
      :name,
      :init,
      :addr1,
      :addr2,
      :addr3,
      :addr4,
      :addr5,
      :ssno,
      :phone1,
      :phone2,
      :notepad,
      :firstname,
      :midinit,
      :lastname,
      :salutation,
      :custfld1,
      :custfld2,
      :custfld3,
      :custfld4,
      :custfld5,
      :custfld6,
      :custfld7,
      :note
    ]
    START_COLUMN = 'EMP'
    END_COLUMN = ''

    def output
      {
        headers: [
          ["!#{START_COLUMN}"].concat(HEADER_COLUMNS.map(&:upcase))
        ],
        rows: @rows
      }
    end
  end
end


