module Riif::DSL
  class Cust < Base
    HEADER_COLUMNS = [
      :name,
      :baddr1,
      :baddr2,
      :baddr3,
      :baddr4,
      :baddr5,
      :saddr1,
      :saddr2,
      :saddr3,
      :saddr4,
      :saddr5,
      :phone1,
      :phone2,
      :faxnum,
      :cont1,
      :cont2,
      :ctype,
      :terms,
      :taxable,
      :limit,
      :resalenum,
      :rep,
      :taxitem,
      :notepad,
      :salutation,
      :companyname,
      :firstname,
      :midinit,
      :lastname,
      :custfld1,
      :custfld2,
      :custfld3,
      :custfld4,
      :custfld5,
      :custfld6,
      :custfld7,
      :jobdesc,
      :jobtype,
      :jobstatus,
      :jobstart,
      :jobprojend,
      :jobend,
      :note
    ]
    START_COLUMN = 'CUST'
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
