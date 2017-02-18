module Riif
  module Rails
    class Renderer
      ActionController::Renderers.add :iif do |iif_string, options|
        filename = options[:filename] || options[:template]
        send_data(
          iif_string,
          filename: "#{filename}.iif",
          type: Mime[:iif],
          disposition: 'attachment'
        )
      end
    end
  end
end
