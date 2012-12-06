class InvoicesController < ActionController::Base
  def index
    respond_to do |format|
      format.iif
    end
  end
end
