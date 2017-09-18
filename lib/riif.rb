require 'riif/version'
require 'riif/iif'
if defined?(Rails)
	if Rails::VERSION::MAJOR > 2
		require 'riif/railtie'
	end
end

module Riif
end
