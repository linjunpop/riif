require 'spec_helper'

describe Riif::DSL::Trns do
  subject { trns }

  let(:expected) { File.read('spec/fixtures/trns.iif') }

  let(:trns) do
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
          klass 'foobar'
          toprint 'N'
          addr1 'Baker'
          addr2 'Customer'
          saddr1 'Watson'
          saddr2 'Recipient'
          rep 'BOB'
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
  end

  its(:output) { should eq expected }

  context 'when arguments are passed to the block' do
    let(:account) { 'Accounts Receivable' }
    let(:trns) do
      Riif::IIF.new do |riif|
        riif.trns do |trns|
          trns.row do |row|
            row.trnsid 123
            row.trnstype 'INVOICE'
            row.date '8/31/1988'
            row.accnt account
            row.name 'Customer'
            row.amount 20
            row.docnum 1
            row.clear 'N'
            row.klass 'foobar'
            row.toprint 'N'
            row.addr1 'Baker'
            row.addr2 'Customer'
            row.saddr1 'Watson'
            row.saddr2 'Recipient'
            row.rep 'BOB'
          end

          trns.spl do
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

          trns.spl do
            row do
              splid '888'
            end
          end
        end
      end
    end

    its(:output) { should eq expected }
  end
end
