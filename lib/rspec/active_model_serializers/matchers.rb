require 'rspec/core'
require 'rspec/active_model_serializers/matchers/render_serializer'

RSpec.configure do |config|
  config.include ActionController::SerializationAssertions, type: :controller
  config.include RSpec::ActiveModelSerializers::Matchers::RenderSerializer
end
