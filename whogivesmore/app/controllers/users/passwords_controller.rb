class Users::PasswordsController < Devise::PasswordsController
 respond_to :json, :html
 skip_before_action :require_login? 
 skip_before_action :require_no_authentication
  
  def create
              # binding.pry
     @user = User.find_by_email(user_params)
     UserMailer.reset_password_instructions(@user).deliver_now
       respond_to do |format|
          if @user.present?
            @user.send_reset_password_instructions

            format.json { render json: {status: :successfully_link_sended}}

            else
             format.json { render json: {status: :error }}
            end
          end

        end

  def user_params
    params.require(:email)
  end




  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
