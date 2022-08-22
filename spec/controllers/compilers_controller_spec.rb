# frozen_string_literal: true

require 'rails_helper'

describe CompilersController do
  before do
    @ruby = ProgrammingLanguage.create(name: 'Ruby', extension: 'rb', command: 'ruby')
  end

  let(:params_to_passed) do
    {
      language_id: @ruby.id,
      code: "puts 'Hello world!'",
      authenticity_token: 'token'
    }
  end

  describe 'routes' do
    let(:execute_code_route) { 'compilers/execute_code' }

    it 'has a route to execute the code' do
      expect({ post: execute_code_route }).to route_to(controller: 'compilers', action: 'execute_code')
    end
  end

  describe 'execute_code' do
    context 'when valid params are included' do
      it 'execute the code successfully' do
        post :execute_code, params: params_to_passed
        parsed_response_body = JSON.parse(response.body)
        expect(parsed_response_body['body'].strip).to eq('Hello world!')
      end
    end

    context 'when invalid params are included' do
      it 'return error' do
        allow(Rails).to receive(:env) { 'development'.inquiry }

        post :execute_code, params: params_to_passed
        parsed_response_body = JSON.parse(response.body)
        expect(parsed_response_body['body'].strip).to eq('Opps! something went wrong!')
      end
    end
  end
end
