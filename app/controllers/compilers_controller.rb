# frozen_string_literal: true

class CompilersController < ApplicationController
  def page; end

  def execute_code
    language_id = code_params[:language_id]
    code = code_params[:code]

    if any_authenticity_token_valid? || Rails.env.test?
      code_compiler = CodeCompiler::Compiler.new(language_id:, code:)
      response = code_compiler.perform
      result = { body: response }
    else
      result = { body: 'Opps! something went wrong!' }
    end

    render json: result
  end

  private

  def code_params
    params.permit(:code, :language_id, :authenticity_token)
  end
end
