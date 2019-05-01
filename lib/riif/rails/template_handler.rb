module Riif
  module Rails
    class TemplateHandler
      cattr_accessor :default_format
      self.default_format = Mime[:iif]

      def self.call(template, source = nil)
        source ||= template.source

        <<-RUBY
          iif = ::Riif::IIF.new

          #{source}

          iif.output
        RUBY
      end

      ActionView::Template.register_template_handler :riif, self
    end
  end
end
