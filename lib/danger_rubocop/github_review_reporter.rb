# frozen_string_literal: true

module DangerRubocop
  class GithubReviewReporter
    def initialize(review)
      @review = review
      @review.start
    end

    def warn(message, file: nil, line: nil)
      @review.warn(message, true, file, line)
    end

    def fail(message, file: nil, line: nil)
      @review.fail(message, true, file, line)
    end

    def markdown(message)
      @review.markdown(message)
    end

    def finalize
      @review.submit
    end
  end
end
