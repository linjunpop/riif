module Riif
  module Rails
    class TemplateHandler
      cattr_accessor :default_format
      self.default_format = Mime[:iif]

      def self.call(template)
        <<-RUBY
          iif = ::Riif::IIF.new

          #{template.source}

          iif.output
        RUBY
      end

      ActionView::Template.register_template_handler :riif, self
    end
  end
end
