# frozen_string_literal: true

module FileOperations
  class BaseFileBuilder
    attr_accessor :file_path, :content

    def initialize(file_path:, content:)
      @file_path = file_path
      @content = content
    end
  end
end
