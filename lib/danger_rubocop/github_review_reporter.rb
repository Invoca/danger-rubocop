# frozen_string_literal: true

module DangerRubocop
  class GithubReviewReporter
    def initialize(review)
      @review = review
      @review.start(use_inline_comments: true)

      @warning_count = 0
      @error_count   = 0
    end

    def warn(message, file: nil, line: nil)
      @warning_count += 1
      @review.warn(message, true, file, line)
    end

    def fail(message, file: nil, line: nil)
      @error_count += 1
      @review.fail(message, true, file, line)
    end

    def markdown(message)
      @review.markdown(message)
    end

    def finalize
      @review.message("Rubocop found #{@warning_count} warning(s) and #{@error_count} error(s)")
      @review.submit
    end
  end
end
