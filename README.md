# Riif

A simple DSL to generate IIF file.

[![Build Status](https://travis-ci.org/linjunpop/riif.svg?branch=master)](https://travis-ci.org/linjunpop/riif)
[![Gem Version](https://badge.fury.io/rb/riif.svg)](http://badge.fury.io/rb/riif)
[![Code Climate](https://codeclimate.com/github/linjunpop/riif.svg)](https://codeclimate.com/github/linjunpop/riif)
[![Coverage Status](https://coveralls.io/repos/linjunpop/riif/badge.svg?branch=master)](https://coveralls.io/r/linjunpop/riif)

## Installation

Add this line to your application's Gemfile:

    gem 'riif'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install riif


## Limitation

You have to use `klass` for `class` and `_1099` for `1099`

## Usage

### With Rails

With a custom template handler, it works with Rails.

```ruby
# invoices_controller.rb

class InvoicesController < ApplicationController
  def show
    respond_to do |format|
      format.iif { render iif: render_to_string, filename: 'batman'}
      format.html
    end
  end
end
```

```ruby
# show.iif.riif

iif.trns do
  row do
    trnsid 123
    trnstype 'INVOICE'
    date '8/31/1988'
    accnt 'Accounts Receivable'
    name 'Customer'
    amount 20
    docnum invoice.id
    clear 'N'
    toprint 'N'
    addr1 'Baker'
    addr2 'Customer'
  end

  spl do
    row do
      splid '777'
      trnstype 'INVOICE'
      date '8/31/1988'
      accnt 'Income Account'
      amount '-20'
      clear 'N'
      qnty '-2'
      price 10
      invitem 'Sales Item'
      taxable 'N'
    end
  end

  spl do
    row do
      splid '888'
    end
  end
end
```

### Without Rails

```ruby
Riif::IIF.new do
  trns do
    row do
      trnsid 123
      trnstype 'INVOICE'
      date '8/31/1988'
      accnt 'Accounts Receivable'
      name 'Customer'
      amount 20
      docnum 1
      clear 'N'
      toprint 'N'
      addr1 'Baker'
      addr2 'Customer'
    end

    spl do
      row do
        splid '777'
        trnstype 'INVOICE'
        date '8/31/1988'
        accnt 'Income Account'
        amount '-20'
        clear 'N'
        qnty '-2'
        price 10
        invitem 'Sales Item'
        taxable 'N'
      end
    end

    spl do
      row do
        splid '888'
      end
    end
  end
end
```

Result:

```
!TRNS	TRNSID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	TOPRINT	ADDR1	ADDR2	ADDR3	ADDR4	ADDR5	DUEDATE	TERMS	PAID	SHIPDATE
!SPL	SPLID	TRNSTYPE	DATE	ACCNT	NAME	CLASS	AMOUNT	DOCNUM	MEMO	CLEAR	QNTY	PRICE	INVITEM	PAYMETH	TAXABLE	REIMBEXP	EXTRA
!ENDTRNS
TRNS	123	INVOICE	8/31/1988	Accounts Receivable	Customer		20	1		N	N	Baker	Customer
SPL	777	INVOICE	8/31/1988	Income Account			-20			N	-2	10	Sales Item		N
SPL	888
ENDTRNS
```

If you prefer, you can pass an argument along with your block:

```ruby
Riif::IIF.new do |riif|
  riif.trns do |trns|
    trns.row do |row|
      row.trnsid 123
      row.trnstype 'INVOICE'
      row.date '8/31/1988'
      row.accnt 'Accounts Receivable'
      row.name 'Customer'
    end
  end
end
```

## Editors

### Vim

```VimL
au BufWinEnter,BufRead,BufNewFile *.riif set filetype=ruby
```

## Resources

[Export or import Intuit Interchange Format (.IIF) files](https://quickbooks.intuit.com/community/Reports-and-accounting/Export-or-import-Intuit-Interchange-Format-IIF-files/m-p/203229)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contributors

:beers:

https://github.com/linjunpop/riif/graphs/contributors

## Changes

See [CHANGELOG.md](CHANGELOG.md)
