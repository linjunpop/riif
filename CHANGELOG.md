# CHANGELOG

## NEXT (unreleased)

## 1.0.0

- Requires Ruby >= 2.5.0.
- #43 Remove duplicate key 'note' in VEND object. [@montulli](https://github.com/montulli)

## 0.9.0

- #40 Stop shipping a gem that overwrites the 'rake' executable from the official 'rake' gem
  when installing this gem through Bundler. [@rg-3](https://github.com/rg-3)

## 0.8.0

- #38 Deprecation warning on Rails 6.0.0.rc1. [@jaredmoody](https://github.com/jaredmoody)

## 0.7.0

- #34 Resolved issues on Rails 2. [@newmedio](https://github.com/newmedio)
- #34 Fixes class & 1099 issues. [@newmedio](https://github.com/newmedio)

## 0.6.0

- #10 Add option to pass an argument to `Riif.new`. [@ghiculescu](https://github.com/ghiculescu)

## 0.5.0

- #9 Implement TIMERHDR. [@ghiculescu](https://github.com/ghiculescu)

## 0.4.0

- #7 Add missing paymeth to transaction type. [@jphpsf](https://github.com/jphpsf)

## 0.3.0

- #6 by [@jphpsf](https://github.com/jphpsf)
  - Shipping address (SADDR1 to SADDR5)
  - Sales rep (rep)
  - Invoice title and memo (INVTITLE and INVMEMO)
  - Purchase order number (PONUM)

## 0.2.0

- #4 - Add support to customize filename
- #5 - Separate different lists into groups

## 0.1.0

- #2 - Implement Mixed document in one IIF file. (DSL had been changed)

## 0.0.1

- Implement OTHERNAME
- Implement TIMEACT
- Implement TERMS
- Implement VEND
- Implement VTYPE
- Implement SHIPMETH
- Implement PAYMETH
- Implement INVMEMO
- Implement INVITEM
- Implement CTYPE
- Implement CLASS
- Implement ACCNT
- Implement EMP
- Implement CUST
- Implement TRNS and SPL
