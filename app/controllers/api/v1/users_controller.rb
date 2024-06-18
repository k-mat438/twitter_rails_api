class Api::V1::UsersController < DeviseTokenAuth::RegistrationsController

  private

  def sign_up_params
    params.permit(:name, :email, :date_of_birth, :phone_number, :password, :password_confirmation)
  end
end
