require 'spec_helper'

describe PostsController do
  render_views

  it 'form_token_tag' do
    get :new

    form_token = controller.instance_eval { @__form_token }
    expect(form_token).not_to be_nil
    expect(response.body.include?('__form_token')).to eq true
  end

  it 'create' do
    get :new

    post :create, post: {title: 'test', content: 'test too'}
    expect(response).to redirect_to '/'
  end
end