# SubmitOnce [![Build Status](https://travis-ci.org/bastengao/submit_once.svg?branch=master)](https://travis-ci.org/bastengao/submit_once)

Prevent from submitting form twice for Rails.

Scenario: when user wanna add a post, usually go to *new* page first, input some information and submit,
it will redirect to success page if these is no error. However after all if user click backward button on browser, it will render history page(the new page before), user could submit same form again.

`SubmitOnce` gem resolve this problem. Form could be submitted only browser fetch a new fresh one.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'submit_once'
```

## Usage

posts/new.html.erb
```erb
<%= form_for @post do |f| %>
  <!-- token tag here -->
  <%= form_token_tag %>

  <%= f.text_field :title %>
  ...
  <%= f.submit %>
<% end %>
```

posts_controller.rb
```ruby
class PostsController < ApplicationController
  # return to root_url when form submit again
  before_action :check_form_token!, only: [:create]

  # OR custom before action
  # before_action :custom_check_form_token

  def index
  end

  def new
  end

  def create
    ...
  end

  private
  def custom_check_form_token
    # using `check_form_token`
    unless check_form_token
      redirect_to posts_url, alert: 'Invalid form token'
    end
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/submit_once. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
