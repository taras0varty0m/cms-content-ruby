# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_validation_error
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  rescue_from StandardError, with: :render_standard_error
  rescue_from ActiveRecord::RecordNotUnique, with: :render_not_unique_error

  private

  def render_validation_error(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end

  def render_record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

  def render_not_unique_error(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end

  def render_standard_error(error)
    render json: { error: error.message }, status: :internal_server_error
  end
end
