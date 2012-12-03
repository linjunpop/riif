require 'spec_helper'

describe Riif::DSL::Klass do

  let(:expected) { File.read('spec/fixtures/klass.iif') }

  let(:klass) {
    Riif::IIF.new.klass do
      row do
        name 'Foo'
      end
    end
  }

  subject { klass }

  it { should eq expected }
end
