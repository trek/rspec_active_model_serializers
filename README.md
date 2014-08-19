# Rspec for ActiveModel::Serializer

RSpec matchers for testing integration between Rails' controllers and ActiveModel::Serialize

## Installation

Add this lines to your application's Gemfile:

```ruby
group :test do
    gem 'rspec_active_model_serializers'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec_active_model_serializers

## Matchers

### render_serializer

Ensures that serializer have been rendered.

```ruby
require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    describe 'GET #index' do
        before do
            get :index
        end

        it 'render post serializer' do
            expect(response).to render_serializer 'PostSerializer'
        end

        it 'render post serializer (using symbol)' do
            expect(response).to render_serializer :post_serializer
        end

        it 'rendered serializer class name starts with Post' do
            expect(response).to render_serializer %r{\APost.+\Z}
        end

        it 'no serializer was rendered' do
            expect(response).to render_serializer nil
        end
    end
end
```


## Contributing

1. Fork it ( https://github.com/SPBTV/rspec_active_model_serializers/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
