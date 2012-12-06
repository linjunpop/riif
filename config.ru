require 'rubygems'
require 'bundler'

Bundler.require :development

require 'riif'

Combustion.initialize! :action_controller, :action_view
run Combustion::Application
