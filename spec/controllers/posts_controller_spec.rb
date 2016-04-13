require 'spec_helper'

describe PostsController do
  render_views

  it 'form_token_tag' do
    get :new

    form_token = controller.instance_eval { @__form_token }
    expect(form_token).not_to be_nil
    expect(response.body.include?('__form_token')).to eq true
  end

  it 'create will be rejected' do
    get :new

    post :create, post: {title: 'test', content: 'test too'}
    expect(response).to redirect_to '/'
    expect(controller.flash[:notice]).to eq "Couldn't repeat submit form"
  end

  it 'create' do
    get :new

    form_token = controller.instance_eval { @__form_token }
    post :create, __form_token: form_token, post: {title: 'test', content: 'test too' }
    
    a_post = Post.last
    expect(response).to redirect_to post_path(a_post)
    expect(controller.flash[:notice]).to eq "Post was successfully created."
  end
end