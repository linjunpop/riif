require 'spec_helper'

describe InvoicesController do
  render_views

  let(:expected) { File.read('../../spec/fixtures/rails/invoices.iif') }

  describe '#index' do
    it 'respond with rendered iif' do
      get :index, format: 'iif'
      response.body.should eq expected
    end
  end
end
