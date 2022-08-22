require 'rails_helper'

describe CodeCompiler::Compiler do
  describe '#perform' do
    before do
      @python_code = ProgrammingLanguage.create(name: 'Python', extension: 'py', command: 'python')
      @ruby_code = ProgrammingLanguage.create(name: 'Ruby', extension: 'rb', command: 'ruby')
    end

    context 'when ruby code is being executed' do
      it 'will execute the code successfully if code is valid' do
        code_compiler = described_class.new(
          language_id: @ruby_code.id, code: "def demo\n puts 'Hello world'\nend\n demo")
        response = code_compiler.perform
        expect(response.strip).to eq('Hello world')
      end
    end

    context 'when python code is being executed' do
      it 'will execute the code successfully if code is valid' do
      end
    end
  end
end
