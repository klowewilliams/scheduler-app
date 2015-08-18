class RegistrationsController < Devise::RegistrationsController



  def create
    super
  end


  private

  def after_sign_up_path_for(resource)
    new_user_session_path
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role_id, :organization_id)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
