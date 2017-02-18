require 'bundler'
Bundler.require(:development)

require 'coveralls'
Coveralls.wear!

require 'riif'

# This line has to before require 'rspec/rails'
Combustion.initialize! :action_controller, :action_view

require 'rspec/rails'

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
  config.infer_spec_type_from_file_location!
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
