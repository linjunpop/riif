require 'spec_helper'

describe Riif::DSL::Klass do

  let(:expected) { File.read('spec/fixtures/klass.iif') }

  let(:klass) {
    Riif::IIF.new do
      klass do
        row do
          name 'Foo'
        end
      end
    end
  }

  subject { klass }

  its(:output) { should eq expected }
end
