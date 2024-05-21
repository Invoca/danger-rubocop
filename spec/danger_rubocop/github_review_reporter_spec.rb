# frozen_string_literal: true

require 'spec_helper'

describe DangerRubocop::GithubReviewReporter do
  subject(:reporter) { described_class.new(review) }

  let(:review) { instance_double(Danger::RequestSources::GitHubSource::Review) }

  before { allow(review).to receive(:start) }

  describe '#warn' do
    let(:message) { 'This is a warning' }
    let(:options) { { file: 'path/to/file.rb', line: 42 } }

    it 'forwards the message to the review' do
      expect(review).to receive(:warn).with(message, true, options[:file], options[:line])

      reporter.warn(message, **options)
    end
  end

  describe '#fail' do
    let(:message) { 'This is an error' }
    let(:options) { { file: 'path/to/file.rb', line: 42 } }

    it 'forwards the message to the review' do
      expect(review).to receive(:fail).with(message, true, options[:file], options[:line])

      reporter.fail(message, **options)
    end
  end

  describe '#markdown' do
    let(:message) { 'This is a markdown message' }
    it 'forwards the message to the review' do
      expect(review).to receive(:markdown).with(message)

      reporter.markdown(message)
    end
  end

  describe '#finalize' do
    it 'submits the review' do
      expect(review).to receive(:submit)

      reporter.finalize
    end
  end
end
