# frozen_string_literal: true

require 'open3'

module CodeCompiler
  class Compiler < CodeCompiler::BaseCompiler
    def perform
      programming_lang = ProgrammingLanguage.find_by(id: language_id)
      file_path = "code_folder/#{generate_random_string}.#{programming_lang.extension}"
      file_operation = FileOperations::CreateFileAndWrite.new(file_path:, content: code)
      file_operation.perform
      output, error, status = execute_command(command: programming_lang.command, file_path:)
      File.delete(file_path) if File.exist?(file_path)
      if status.success?
        output
      else
        lang_based_parse_error_message(language: programming_lang, message: error, file_path:)
      end
    end

    private

    # Open3 remove the unwanted code to prevent the system.
    def execute_command(command:, file_path:)
      Open3.capture3("#{command} #{file_path}")
    end

    def generate_random_string
      (0...7).map { ('a'..'z').to_a[rand(12)] }.join
    end

    # TODO: Build a message parser based on programming language
    def lang_based_parse_error_message(language:, message:, file_path:)
      case language.extension
      when 'rb'
        message.split("\n").first.gsub(file_path, '').gsub(/:\d:in/, '')
      when 'py'
        "#{message.split("\n")[0].split(',').last}: #{message.split("\n").last}"
      else
        Rails.logger.error(
          "[#{self.class.name}] Opps! internal error"
        )
      end
    end
  end
end
