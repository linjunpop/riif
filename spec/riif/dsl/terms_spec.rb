require 'spec_helper'

describe Riif::DSL::Terms do
  let(:expected) { File.read('spec/fixtures/terms.iif') }

  let(:terms) {
    Riif::IIF.new do
      terms do
        row do
          name 'terms 1'
          duedays 10
          discper 0.3
          discdays 1
          termstype 0
        end
      end
    end
  }

  subject { terms }

  its(:output) { should eq expected }
end
