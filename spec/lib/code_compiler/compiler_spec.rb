# frozen_string_literal: true

require 'rails_helper'

describe CodeCompiler::Compiler do
  let(:ruby_valid_code) { "def demo\n puts 'Hello world'\nend\n demo" }
  let(:ruby_invalid_code) { "def demo\n puts 'Hello world'\nend\n invalid_method_call" }
  let(:python_valid_code) { "def my_function():\n print('Hello from a function')\nmy_function();" }

  describe '#perform' do
    before do
      @python_code = ProgrammingLanguage.create(name: 'Python', extension: 'py', command: 'python')
      @ruby_code = ProgrammingLanguage.create(name: 'Ruby', extension: 'rb', command: 'ruby')
    end

    context 'when ruby code is being executed' do
      it 'will execute the code successfully if code is valid' do
        code_compiler = described_class.new(
          language_id: @ruby_code.id, code: ruby_valid_code
        )
        response = code_compiler.perform
        expect(response.strip).to eq('Hello world')
      end

      it 'will throw an error if code is invalid' do
        code_compiler = described_class.new(
          language_id: @ruby_code.id, code: ruby_invalid_code
        )
        response = code_compiler.perform
        expect(response.strip).to eq("`<main>': undefined local variable or method `invalid_method_call' for main:Object (NameError)")
      end

      it 'will log an error if invalid programming language is being executed' do
        allow_any_instance_of(ProgrammingLanguage).to receive(:extension).and_return('invalid')
        allow(Rails.logger).to receive(:error).and_call_original

        code_compiler = described_class.new(
          language_id: @ruby_code.id, code: ruby_invalid_code
        )
        code_compiler.perform
        expect(Rails.logger).to have_received(:error)
          .with('[CodeCompiler::Compiler] Opps! internal error')
      end
    end

    context 'when python code is being executed' do
      it 'will execute the code successfully if code is valid' do
        code_compiler = described_class.new(
          language_id: @python_code.id, code: python_valid_code
        )
        response = code_compiler.perform
        expect(response.strip).to eq('Hello from a function')
      end

      it 'will throw an error if code is invalid' do
        code_compiler = described_class.new(
          language_id: @python_code.id, code: ruby_invalid_code
        )
        response = code_compiler.perform
        expect(response.strip).to eq('line 1: SyntaxError: invalid syntax')
      end
    end
  end
end
