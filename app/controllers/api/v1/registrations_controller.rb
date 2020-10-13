class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create
  skip_before_action :verify_authenticity_token, only: :create
  # sign up
  def create
    user = User.new user_params
    if user.save
      render json: {
        messages: 'Sign Up Successfully',
        is_success: true,
        data: { user: user }
      }, status: :ok
    else
      render json: {
        messages: 'Sign Up Failded',
        is_success: false,
        data: user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :language, :currency, :time_zone, :email, :password, :password_confirmation)
  end

  def ensure_params_exist
    return if params[:user].present?

    byebug
    render json: {
      messages: 'Missing Params',
      is_success: false,
      data: {}
    }, status: :bad_request
  end
end
