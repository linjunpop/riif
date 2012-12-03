# Riif

A simple DSL to generate IIF file.

[![Build Status](https://secure.travis-ci.org/linjunpop/riif.png?branch=master)](https://travis-ci.org/linjunpop/riif)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/linjunpop/riif)

## Installation

Add this line to your application's Gemfile:

    gem 'riif'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install riif

## Usage

### With Rails

With a custom template handler, it works with Rails.

```ruby
# invoices_controller.rb

class InvoicesController < ApplicationController
  def show
    respond_to do |format|
      format.iif
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
Riif::IIF.new.trns do
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

## Editors

### Vim

```VimL
au BufWinEnter,BufRead,BufNewFile *.riif set filetype=ruby
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Changes

See [CHANGELOG.md]()
