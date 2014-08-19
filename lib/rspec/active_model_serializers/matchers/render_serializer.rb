module RSpec
  module ActiveModelSerializers
    module Matchers
      module RenderSerializer
        # @private
        class RenderSerializerMatcher < RSpec::Matchers::BuiltIn::BaseMatcher

          def initialize(scope, expected, message=nil)
            @expected = expected
            @message = message
            @scope = scope
          end

          # @api private
          def matches?(*)
            match_unless_raises ActiveSupport::TestCase::Assertion do
              @scope.assert_serializer expected, @message
            end
          end

          # @api private
          def failure_message
            rescued_exception.message
          end

          # @api private
          def failure_message_when_negated
            "expected not to render #{expected.inspect}, but did"
          end
        end

        # Delegates to `assert_serializer`.
        #
        # @example
        #     expect(response).to have_rendered_serializer("PostSerializer")
        def have_rendered_serializer(options, message=nil)
          RenderSerializerMatcher.new(self, options, message)
        end

        alias_method :render_serializer, :have_rendered_serializer
      end
    end
  end
end
