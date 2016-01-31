require 'rails'
require 'submit_once/controller_helper'
require 'submit_once/View_helper'

module SubmitOnce
  class Railtie < Rails::Railtie
    initializer "submit_once.controller_helper" do
      ActiveSupport.on_load :action_controller do
        include ControllerHelper
      end

      ActiveSupport.on_load :action_view do
        puts 'load action view'
        include ViewHelper
      end
    end
  end
end
