require 'spec_helper'

describe Riif::DSL::Emp do

  let(:expected) { File.read('spec/fixtures/emp.iif') }

  let(:emp) {
    Riif::IIF.new do
      emp do
        row do
          name 'Alfred'
          init 'Master'
          addr1 'Backer'
          addr2 '37'
          salutation 'Doctor'
        end
      end
    end
  }

  subject { emp }

  its(:output) { should eq expected }
end
