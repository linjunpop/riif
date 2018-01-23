require 'spec_helper'

describe Riif::DSL::Timeact do
  let(:expected) { File.read('spec/fixtures/timeact.iif') }

  let(:timeact) {
    Riif::IIF.new do
    timerhdr do
      row do
        ver 8
        rel 0
        companyname 'Import Test Company'
        importedbefore 'N'
        fromtimer 'Y'
        companycreatetime '1208544781'
      end
    end
    timeact do
      row do
        date '06/21/97'
        job 'job 1'
        emp 'Jun'
        item 'item 1'
        duration '13:40'
        proj 'class 1'
        billingstatus 0
      end
    end
    end
  }

  subject { timeact }

  its(:output) { should eq expected }
end
