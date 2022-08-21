module CodeCompiler
  class Compiler < CodeCompiler::BaseCompiler
    def perform
      programming_lang = ProgrammingLanguage.find_by(id: language_id)
      random_string = generate_random_string
      file_path = "code_folder/#{random_string}.#{programming_lang.extension}"
      perform_file_operation(file_path:)
      output, error, status = execute_command(command: programming_lang.command, file_path:)
      File.delete(file_path) if File.exist?(file_path)
      status.success? ? output : error
    end

    private

    # Open3 remove the unwanted code to prevent the system.
    def execute_command(command:, file_path:)
      Open3.capture3("#{command} #{file_path}")
    end

    def generate_random_string
      (0...7).map { ('a'..'z').to_a[rand(12)] }.join
    end

    def perform_file_operation(file_path:)
      Rails.root.join(file_path)
      out_file = File.new(file_path, 'w')
      out_file.puts(code)
      out_file.close
    end
  end
end
