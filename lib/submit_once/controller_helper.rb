require 'active_support/concern'

module SubmitOnce
  module ControllerHelper
    extend ActiveSupport::Concern

    included do
      if respond_to?(:helper_method)
        helper_method :gen_form_token
      end
    end

    # TODO: force or no
    def check_form_token
      if session[TOKEN_KEY] == params[TOKEN_KEY]
        session[TOKEN_KEY] = nil
        true
      else
        false
      end
    end

    def check_form_token!
      unless check_form_token
        # TODO: path, and i18n
        redirect_to '/', notice: "Couldn't repeat submit form"
      end
    end

    def gen_form_token
      @__form_token ||=
      (session[TOKEN_KEY] = Digest::SHA1.hexdigest((Time.now.to_i + rand(0xffffff)).to_s)[0..39])
    end
  end
end
