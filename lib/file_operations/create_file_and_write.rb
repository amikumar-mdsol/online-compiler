# frozen_string_literal: true

module FileOperations
  class CreateFileAndWrite < FileOperations::BaseFileBuilder
    def perform
      Rails.root.join(file_path)

      begin
        write_to_file
      rescue Errno::ENOENT => e
        Rails.logger.error(
          "[#{self.class.name}] Error while writing code to file: #{e.message}"
        )
      end
    end

    private

    def write_to_file
      out_file = File.new(file_path, 'w')
      out_file.puts(content)
      out_file.close
    end
  end
end
