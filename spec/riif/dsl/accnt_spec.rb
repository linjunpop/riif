require 'spec_helper'

describe Riif::DSL::Accnt do

  let(:expected) { File.read('spec/fixtures/accnt.iif') }

  let(:accnt) {
    Riif::IIF.new.accnt do
      row do
        name 'Jun Lin'
        accnttype 'AR'
        accnum 47
      end
    end
  }

  subject { accnt }

  it { should eq expected }
end
