module SubmitOnce
  module ViewHelper

    def form_token_tag
      key, token = gen_form_token
      "#{hidden_field_tag(TOKEN_KEY, key)}#{hidden_field_tag(TOKEN_VALUE, token)}"
    end
  end
end