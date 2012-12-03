require 'spec_helper'

describe Riif::DSL::Cust do
  let(:expected) { File.read('spec/fixtures/cust.iif') }

  let(:cust) {
    Riif::IIF.new.cust do
      row do
        name 'Jun Lin'
        phone1 '12312323242'
      end
    end
  }

  subject { cust }

  it { should eq expected }
end
