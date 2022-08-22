# frozen_string_literal: true

module CodeCompiler
  class BaseCompiler
    attr_accessor :language_id, :code

    def initialize(language_id:, code:)
      @language_id = language_id
      @code = code
    end
  end
end
