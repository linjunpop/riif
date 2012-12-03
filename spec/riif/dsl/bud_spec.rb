require 'spec_helper'

describe Riif::DSL::Bud do

  let(:expected) { File.read('spec/fixtures/bud.iif') }

  let(:bud) {
    Riif::IIF.new.bud do
      row do
        accnt 'Accounts Receivable'
        period 'MONTH'
        amount 'foo'
        startdate '3/14/12'
      end
    end
  }

  subject { bud }

  it { should eq expected }
end
