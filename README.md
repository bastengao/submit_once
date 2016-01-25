# SubmitOnce

Prevent from submitting form twice for rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'submit_once'
```

## Usage

posts/new.html.erb
```
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

  def index
  end

  def new
  end

  def create
    ...
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/submit_once. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
