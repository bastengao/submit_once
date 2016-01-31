module SubmitOnce
  module ViewHelper

    def form_token_tag
      hidden_field_tag(TOKEN_KEY, gen_form_token)
    end
  end
end