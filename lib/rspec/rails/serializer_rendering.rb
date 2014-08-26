module RSpec
  module Rails
    # Helpers for optionally rendering views in controller specs.
    module SerializerRendering
      included do
        before do
          unless render_views?
            allow_any_instance_of(ActiveModel::Serializer).to receive(:serializable_object).and_return({})
            allow_any_instance_of(ActiveModel::Serializer).to receive(:serializable_hash).and_return({})
          end
        end
      end
    end

    module ControllerExampleGroup
      include ViewRendering
      include SerializerRendering
    end
  end
end
