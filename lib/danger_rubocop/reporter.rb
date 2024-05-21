# frozen_string_literal: true

module DangerRubocop
  class Reporter
    def initialize(plugin)
      @plugin = plugin
    end

    def warn(message, **options)
      @plugin.warn(message, **options)
    end

    def fail(message, **options)
      @plugin.fail(message, **options)
    end

    def markdown(message)
      @plugin.markdown(message)
    end

    def finalize; end
  end
end
