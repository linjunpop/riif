require 'spec_helper'

describe Riif::DSL::Timeact do
  let(:expected) { File.read('spec/fixtures/timeact.iif') }

  let(:timeact) {
    Riif::IIF.new.timeact do
      row do
        date '06/21/97'
        job 'job 1'
        emp 'Jun'
        item 'item 1'
        duration '13:40'
        proj 'klass 1'
        billingstatus 0
      end
    end
  }

  subject { timeact }

  it { should eq expected }
end

