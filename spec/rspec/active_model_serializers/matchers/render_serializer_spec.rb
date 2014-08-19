require 'spec_helper'

%w[render_serializer have_rendered_serializer].each do |serializer_expectation|
  describe serializer_expectation do
    include RSpec::ActiveModelSerializers::Matchers::RenderSerializer
    let(:response) { ActionController::TestResponse.new }

    context 'given a hash' do
      it 'delegates to assert_serializer' do
        expect(self).to receive(:assert_serializer).with({serializer: 'ProfileSerializer'}, 'this message')
        expect('response').to send(serializer_expectation, {serializer: 'ProfileSerializer'}, 'this message')
      end
    end

    context 'given a string' do
      it 'delegates to assert_serializer' do
        expect(self).to receive(:assert_serializer).with('ProfileSerializer', 'this message')
        expect('response').to send(serializer_expectation, 'ProfileSerializer', 'this message')
      end
    end

    context 'given a symbol' do
      it 'delegates to assert_serializer' do
        expect(self).to receive(:assert_serializer).with(:profile_serializer, 'this message')
        expect('response').to send(serializer_expectation, :profile_serializer, 'this message')
      end
    end

    context 'with should' do
      context 'when assert_serializer passes' do
        it 'passes' do
          def assert_serializer(*)
          end
          expect {
            expect(response).to send(serializer_expectation, 'ProfileSerializer')
          }.not_to raise_exception
        end
      end

      context 'when assert_serializer fails' do
        it 'uses failure message from assert_template' do
          def assert_serializer(*)
            raise ActiveSupport::TestCase::Assertion.new('this message')
          end
          expect {
            expect(response).to send(serializer_expectation, 'ProfileSerializer')
          }.to raise_error('this message')
        end
      end

      context 'when fails due to some other exception' do
        it 'raises that exception' do
          def assert_serializer(*)
            raise 'oops'
          end
          expect {
            expect(response).to send(serializer_expectation, 'ProfileSerializer')
          }.to raise_exception('oops')
        end
      end
    end

    context 'with should_not' do
      context 'when assert_serializer fails' do
        it 'passes' do
          def assert_serializer(*)
            raise ActiveSupport::TestCase::Assertion.new('this message')
          end
          expect {
            expect(response).not_to send(serializer_expectation, 'ProfileSerializer')
          }.not_to raise_exception
        end
      end

      context 'when assert_serializer passes' do
        it 'fails with custom failure message' do
          def assert_serializer(*)
          end
          expect {
            expect(response).not_to send(serializer_expectation, 'ProfileSerializer')
          }.to raise_error(/expected not to render "ProfileSerializer", but did/)
        end
      end

      context 'when fails due to some other exception' do
        it 'raises that exception' do
          def assert_serializer(*)
            raise 'oops'
          end
          expect {
            expect(response).not_to send(serializer_expectation, 'ProfileSerializer')
          }.to raise_exception('oops')
        end
      end
    end
  end
end
