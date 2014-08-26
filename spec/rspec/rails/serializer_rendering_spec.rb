require 'spec_helper'

RSpec.describe RSpec::Rails::SerializerRendering do
  let(:group) do
    RSpec::Core::ExampleGroup.describe do
      def controller
        ActionController::Base.new do
          def foo
            render json: 42
          end
        end
      end
      include RSpec::Rails::SerializerRendering
    end
  end

  it {
    exepct(controller.foo.response).to eq "53"
  }
end
