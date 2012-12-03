require 'spec_helper'

describe Riif::DSL::Vend do
  let(:expected) { File.read('spec/fixtures/vend.iif') }

  let(:vend) {
    Riif::IIF.new.vend do
      row do
        name 'Jun Lin'
        phone1 '12312323242'
        _1099 'Y'
      end
    end
  }

  subject { vend }

  it { should eq expected }
end
