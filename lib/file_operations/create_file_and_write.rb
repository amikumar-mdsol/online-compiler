module FileOperations
  class CreateFileAndWrite < FileOperations::BaseFileBuilder
    def write_to_file
      Rails.root.join(file_path)

      begin
        out_file = File.new(file_path, 'w')
        out_file.puts(content)
        out_file.close
      rescue Errno::ENOENT => e
        Rails.logger.error(
          "#{self.class.name} Error while writing code to file: #{e.message}"
        )
        nil
      end
    end
  end
end
