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
      # TODO: 顺便做超时 token 清理工作
      clean_expired_token

      return false if params[TOKEN_KEY].blank?

      form_token_key = params[TOKEN_KEY]
      if session[form_token_key] == params[TOKEN_VALUE]
        session.delete(form_token_key)
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
      clean_expired_token
      
      @__form_token_key ||= "#{TOKEN_KEY}#{Time.now.to_i}"
      @__form_token ||=
        (session[@__form_token_key] = Digest::SHA1.hexdigest((Time.now.to_i + rand(0xffffff)).to_s)[0..39])
      [@__form_token_key, @__form_token]
    end

    def clean_expired_token
      session.each do |key, value|
        if key.start_with? TOKEN_KEY
          timestamp = Time.zone.at key.sub(TOKEN_KEY, '').to_i
          session.delete(key) if timestamp < 30.minutes.ago
        end
      end
    end
  end
end
