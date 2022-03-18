class ApplicationController < ActionController::API
  include ActionController::Cookies

rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
rescue_from ActionController::UnpermittedParameters, with: :render_unpermitted_params
private

  def render_record_invalid(invalid)
    # byebug
    render json:  {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
  def render_record_not_found(record)
    # byebug
    render json: {errors: record.full_messages}, status: :not_found
  end
  
  #tried to get this working but didn't...
  def render_unpermitted_params(record)
    # byebug
    render json: {errors: record.message}, status: :unprocessable_entity
  end
end
