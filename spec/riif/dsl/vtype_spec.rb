require 'spec_helper'

describe Riif::DSL::Vtype do
  let(:expected) { File.read('spec/fixtures/vtype.iif') }

  let(:vtype) {
    Riif::IIF.new.vtype do
      row do
        name 'vtype 1'
      end
    end
  }

  subject { vtype }

  it { should eq expected }
end
