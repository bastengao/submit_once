# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'submit_once'
require 'rspec/rails'
Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  # config.filter_run focus: true
  # config.run_all_when_everything_filtered = true
  config.infer_spec_type_from_file_location!
  config.order = "random"
end
