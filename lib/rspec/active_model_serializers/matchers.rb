require 'rspec/core'
require 'rspec/active_model_serializers/matchers/render_serializer'

RSpec.configure do |config|
  config.include RSpec::ActiveModelSerializers::Matchers::RenderSerializer
end
