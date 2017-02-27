class InvoicesController < ActionController::Base
  def index
    respond_to do |format|
      format.iif {
        render iif: render_to_string(locals: {awesome: "Bender"}),
        filename: 'batman'
      }
    end
  end
end
