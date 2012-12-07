require 'spec_helper'

describe Riif::DSL::Ctype do
  let(:expected) { File.read('spec/fixtures/ctype.iif') }

  let(:ctype) {
    Riif::IIF.new do
      ctype do
        row do
          name 'Bar'
        end
      end
    end
  }

  subject { ctype }

  its(:output) { should eq expected }
end
