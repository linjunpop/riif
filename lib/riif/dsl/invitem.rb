module Riif::DSL
  class Invitem < Base
    HEADER_COLUMNS = [
      :name,
      :invitemtype,
      :desc,
      :purchasedesc,
      :accnt,
      :assetaccnt,
      :cogsaccnt,
      :price,
      :cost,
      :taxable,
      :paymeth,
      :taxvend,
      :taxdist,
      :toprint,
      :prefvend,
      :reorderpoint,
      :extra,
      :custfld1,
      :custfld2,
      :custfld3,
      :custfld4,
      :custfld5,
      :dep_type,
      :ispassedthru
    ]
    START_COLUMN = 'INVITEM'
    END_COLUMN = ''
  end
end
