require 'rails'
require 'submit_once/controller_helper'
require 'submit_once/view_helper'

module SubmitOnce
  class Railtie < Rails::Railtie
    initializer "submit_once.controller_helper" do
      ActiveSupport.on_load :action_controller do
        include ControllerHelper
      end

      ActiveSupport.on_load :action_view do
        include ViewHelper
      end
    end
  end
end
