class ApplicationController < ActionController::API
  include ActionController::Cookies
  # rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  # rescue_from ActiveRecord::RecordNInvalid, with: :render_record_invalid


  private
  def render_record_not_found(invalid)
    render json: { error: "#{invalid.model} not found" }, status: :not_found
  end

  def render_record_invalid(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
