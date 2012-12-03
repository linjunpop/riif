require 'spec_helper'

describe Riif::DSL::Invmemo do
  let(:expected) { File.read('spec/fixtures/invmemo.iif') }

  let(:invmemo) {
    Riif::IIF.new.invmemo do
      row do
        name 'invmemo 1'
      end
    end
  }

  subject { invmemo }

  it { should eq expected }
end
