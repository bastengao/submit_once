require 'rails'
require 'submit_once/controller_helper'

module SubmitOnce
  class Railtie < Rails::Railtie
    initializer "submit_once.controller_helper" do
      ActiveSupport.on_load :action_controller do
        include ControllerHelper
      end
    end
  end
end
