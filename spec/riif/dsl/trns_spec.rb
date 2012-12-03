require 'spec_helper'

describe Riif::DSL::Trns do

  let(:invoice) { File.read('spec/fixtures/invoice.iif') }

  let(:trns) {
    Riif::IIF.new.trns do
      row do
        trnsid '123'
        date '33'
      end

      row do
        trnsid '456'
      end
    end
  }

  subject { trns }

  it { should eq invoice }
end
