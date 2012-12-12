require 'spec_helper'

describe InvoicesController do
  render_views

  let(:expected) { File.read('spec/fixtures/rails/invoices.iif') }

  describe '#index' do

    before do
      get :index, format: 'iif'
    end

    it 'respond with rendered iif' do
      response.body.should eq expected
    end

    it 'respond with QuickBooks content type' do
      response.header['Content-Type'].should eq 'application/qbooks'
    end

    it 'respond with filename: batman.iif' do
      response.header['Content-Disposition'].should =~ /filename="batman\.iif"/
    end
  end
end
