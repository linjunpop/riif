require 'spec_helper'

describe Riif::DSL::Invmemo do
  let(:expected) { File.read('spec/fixtures/invmemo.iif') }

  let(:invmemo) {
    Riif::IIF.new do
      invmemo do
        row do
          name 'invmemo 1'
        end
      end
    end
  }

  subject { invmemo }

  its(:output) { should eq expected }
end
