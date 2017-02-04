class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
 skip_before_action :require_no_authentication

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  #skip_before_action :require_login!, only: [:create,:new]
   skip_before_action :require_login?
   skip_before_action :verify_signed_out_user

  def create



  resource = User.find_for_database_authentication(:email => params[:user][
    :email])

    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user][:password])
      auth_token = resource.generate_auth_token
      render json: {status: :ok ,auth_token: auth_token ,picture: resource.picture,data: resource} 
      
    else
      invalid_login_attempt
    end

  end
  
  def destroy
    if resource = User.where("auth_token=?",params[:auth_token]).first
      puts resource.inspect
     resource.update_attribute(:auth_token,'nil')
      render json: {status: :delete,auth_token: "null"} 
    else
      render json: {status: :error,auth_token: "not found"} 
    end
    
  end

  private
    def invalid_login_attempt
      render json: { errors: [ { detail:"Error with your login or password" }]}, status: 401
    end
end
