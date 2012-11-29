module Riif
  class IIF
    def trns
      trns_headers = %w(
          !TRNS TRNSID TRNSTYPE DATE  ACCNT NAME  CLASS AMOUNT \
          DOCNUM  MEMO  CLEAR TOPRINT ADDR1 ADDR2 ADDR3 ADDR4 ADDR5 DUEDATE TERMS \
          PAID  SHIPDATE
      )
      spl_headers = %w{
          !SPL  SPLID TRNSTYPE  DATE  ACCNT NAME  CLASS AMOUNT  DOCNUM  MEMO  \
          CLEAR QNTY  PRICE INVITEM PAYMETH TAXABLE REIMBEXP  EXTRA
      }

      CSV.generate(col_sep: "\t") do |tsv|
        tsv << trns_headers
        tsv << spl_headers
        tsv << ['!ENDTRNS']
        yield tsv
      end
    end
  end
end
