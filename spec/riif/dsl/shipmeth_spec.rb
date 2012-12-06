require 'spec_helper'

describe Riif::DSL::Shipmeth do
  let(:expected) { File.read('spec/fixtures/shipmeth.iif') }

  let(:shipmeth) {
    Riif::IIF.new do
      shipmeth do
        row do
          name 'shipmeth 1'
        end
      end
    end
  }

  subject { shipmeth }

  its(:output) { should eq expected }
end
