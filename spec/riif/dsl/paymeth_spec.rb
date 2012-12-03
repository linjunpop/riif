require 'spec_helper'

describe Riif::DSL::Paymeth do
  let(:expected) { File.read('spec/fixtures/paymeth.iif') }

  let(:paymeth) {
    Riif::IIF.new.paymeth do
      row do
        name 'paymeth 1'
      end
    end
  }

  subject { paymeth }

  it { should eq expected }
end
