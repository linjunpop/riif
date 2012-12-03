require 'spec_helper'

describe Riif::DSL::Emp do

  let(:expected) { File.read('spec/fixtures/emp.iif') }

  let(:emp) {
    Riif::IIF.new.emp do
      row do
        name 'Alfred'
        init 'Master'
        addr1 'Backer'
        addr2 '37'
        salutation 'Doctor'
      end
    end
  }

  subject { emp }

  it { should eq expected }
end

