class ApplicationController < ActionController::Base
  # include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session
  respond_to :json,:html
  before_action :require_login?
  helper_method :current_user
  before_action :mailer_set_url_options

  # # after_action :store_location

  before_action :configure_permitted_parameters, if: :devise_controller?



  def require_login?
   unless params[:auth_token].present? && authenticate_token.present?
      # render 'teams#index'
       render json:{status:"u have to sign in or sign up"}
    else
      teams_path
    end
end
  def current_user
    authenticate_token
  end


  private
    def authenticate_token
      
        User.find_by(auth_token: params[:auth_token])
    end

def mailer_set_url_options
  ActionMailer::Base.default_url_options[:host] = request.host_with_port
end

  # def store_location
  #   session[:previous_url] = request.referer
  # end

  # def after_sign_in_path_for(resource)
  #      teams_path
  # end
  

  # def after_sign_out_path_for(resource)
  #   mains_index_path
  # end

protected

    def configure_permitted_parameters
        # Fields for sign up
        # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:date ,:email, :password) }
        # Fields for editing an existing account

devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:date,:email,:password,picture_attributes: [:avatar],:team_items=>[],:basket_items=>[]]) 

 devise_parameter_sanitizer.permit(:update,keys: [:first_name,:last_name,:date,:email,:password,picture_attributes: [:avatar],:team_items=>[],:basket_items=>[]]) 
    end

end
