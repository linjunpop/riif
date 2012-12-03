require 'spec_helper'

describe Riif::DSL::Shipmeth do
  let(:expected) { File.read('spec/fixtures/shipmeth.iif') }

  let(:shipmeth) {
    Riif::IIF.new.shipmeth do
      row do
        name 'shipmeth 1'
      end
    end
  }

  subject { shipmeth }

  it { should eq expected }
end
