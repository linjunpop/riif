require 'spec_helper'

describe Riif::DSL::Vtype do
  let(:expected) { File.read('spec/fixtures/vtype.iif') }

  let(:vtype) {
    Riif::IIF.new do
      vtype do
        row do
          name 'vtype 1'
        end
      end
    end
  }

  subject { vtype }

  its(:output) { should eq expected }
end
