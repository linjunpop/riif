require 'rails'

module Riif
  class Railtie < ::Rails::Railtie
    initializer 'riif' do
      ::ActiveSupport.on_load(:action_view) do
        unless ::Mime::Type.lookup_by_extension(:iif)
          ::Mime::Type.register "application/qbooks", :iif,
            %w(application/qbookspro text/iif)
        end

        require 'riif/rails/template_handler'
      end
    end
  end
end
