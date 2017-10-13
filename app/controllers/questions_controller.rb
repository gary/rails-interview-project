# frozen_string_literal: true

# The public REST API for Questions
# @version 1.0
class QuestionsController < ApplicationController
  rescue_from ActionController::ParameterMissing, ActiveRecord::RecordNotFound,
              with: :tenant_unauthorized

  before_action :authenticate_tenant

  # @api
  def index
    params.require(:api_key)

    @questions = Question.not_private
  end

  private

  def authenticate_tenant
    @tenant = Tenant.find_by!(api_key: params[:api_key])
  end

  def tenant_unauthorized
    render json: { message: 'Invalid API key' }, status: 401
  end
end
