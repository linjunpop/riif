require 'bundler'
Bundler.require(:development)

require 'coveralls'
Coveralls.wear!

require 'riif'

# This line has to before require 'rspec/rails'
Combustion.initialize! :action_controller, :action_view

require 'rspec/rails'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
