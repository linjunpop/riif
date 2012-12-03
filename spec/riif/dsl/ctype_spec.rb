require 'spec_helper'

describe Riif::DSL::Ctype do
  let(:expected) { File.read('spec/fixtures/ctype.iif') }

  let(:ctype) {
    Riif::IIF.new.ctype do
      row do
        name 'Bar'
      end
    end
  }

  subject { ctype }

  it { should eq expected }
end
