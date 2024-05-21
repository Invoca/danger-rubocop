# frozen_string_literal: true

require 'spec_helper'

describe DangerRubocop::Reporter do
  subject(:reporter) { described_class.new(plugin) }

  let(:plugin) { instance_double(Danger::DangerfileMessagingPlugin) }

  describe '#warn' do
    it 'forwards the message to the plugin' do
      message = 'This is a warning'
      options = { file: 'path/to/file.rb', line: 42 }

      expect(plugin).to receive(:warn).with(message, **options)

      reporter.warn(message, **options)
    end
  end

  describe '#fail' do
    it 'forwards the message to the plugin' do
      message = 'This is an error'
      options = { file: 'path/to/file.rb', line: 42 }

      expect(plugin).to receive(:fail).with(message, **options)

      reporter.fail(message, **options)
    end
  end

  describe '#markdown' do
    it 'forwards the message to the plugin' do
      message = 'This is a markdown message'

      expect(plugin).to receive(:markdown).with(message)

      reporter.markdown(message)
    end
  end

  describe '#finalize' do
    it 'does nothing' do
      expect { reporter.finalize }.not_to raise_error
    end
  end
end
