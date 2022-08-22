# frozen_string_literal: true

require 'rails_helper'

describe FileOperations::CreateFileAndWrite do
  before do
    allow(Rails.logger).to receive(:error).and_call_original
  end

  context '#perform' do
    it 'will create the file and succeffuly write content to it when file path is valid' do
      file_path = generate_file_path(prefix: 'code_folder')
      file_create_and_writer = described_class.new(file_path:, content: 'Hello world')
      file_create_and_writer.perform
      file = File.open(file_path)
      expect(file.readlines.map(&:chomp).first).to eq('Hello world')
      remove_file(file_path:)
    end

    it 'will log an error and wont create the file when file path is valid' do
      file_path = generate_file_path(prefix: 'code_folders')
      file_create_and_writer = described_class.new(file_path:, content: 'Hello world')
      file_create_and_writer.perform
      expect(Rails.logger).to have_received(:error)
        .with("[FileOperations::CreateFileAndWrite] Error while writing code to file: No such file or directory @ rb_sysopen - #{file_path}")
    end
  end

  def generate_file_path(prefix:)
    "#{prefix}/#{(0...7).map { ('a'..'z').to_a[rand(12)] }.join}.rb"
  end

  def remove_file(file_path:)
    File.delete(file_path) if File.exist?(file_path)
  end
end
