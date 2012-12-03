require 'spec_helper'

describe Riif::DSL::Terms do
  let(:expected) { File.read('spec/fixtures/terms.iif') }

  let(:terms) {
    Riif::IIF.new.terms do
      row do
        name 'terms 1'
        duedays 10
        discper 0.3
        discdays 1
        termstype 0
      end
    end
  }

  subject { terms }

  it { should eq expected }
end
