require 'spec_helper'

describe PostsController do
  render_views

  it 'form_token_tag' do
    get :new

    form_token = controller.instance_eval { @__form_token }
    expect(form_token).not_to be_nil
    expect(response.body.include?('__ft_k')).to eq true
    expect(response.body.include?('__ft_v')).to eq true
  end

  it 'create will be rejected' do
    get :new

    post :create, post: {title: 'test', content: 'test too'}
    expect(response).to redirect_to '/'
    expect(controller.flash[:notice]).to eq "Couldn't repeat submit form"
  end

  it 'create' do
    get :new

    form_token_key = controller.instance_eval { @__form_token_key }
    form_token = controller.instance_eval { @__form_token }
    post :create, __ft_k: form_token_key, __ft_v: form_token, post: {title: 'test', content: 'test too' }

    a_post = Post.last
    expect(response).to redirect_to post_path(a_post)
    expect(controller.flash[:notice]).to eq "Post was successfully created."
  end

  it 'expired token' do
    Timecop.travel(31.minutes.ago) do
      get :new
    end

    form_token_key = controller.instance_eval { @__form_token_key }
    form_token = controller.instance_eval { @__form_token }
    post :create, __form_token_key: form_token_key, __form_token_value: form_token, post: {title: 'test', content: 'test too' }

    expect(response).to redirect_to '/'
    expect(controller.flash[:notice]).to eq "Couldn't repeat submit form"
  end
end
