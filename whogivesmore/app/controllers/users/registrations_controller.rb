class Users::RegistrationsController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  skip_before_action :require_login?,only:[:create]
  # skip_before_action :require_no_authentication


  def index
    @users=User.all

    @teams=Team.all
  end

  def new
    @user=User.new
    @user.build_picture

   @user.teams.build
    @user.donations.build
    @user.account_informations.build
    @user.baskets.build
  end

  def edit
  end

  def create
       # binding.pry
    @user = User.new(user_params)
    
    respond_to do |format|
  binding.pry
    if @user.save
      format.json { render json:{status: :success, data: @user }}
    else
      format.html { render :new }
      format.json { render json: {status: :error,data: @user.errors} }
      end
    end

  end

  def update
    
    resource = User.find_for_database_authentication(:email => params[:user][:email])

    respond_to do |format|
    resource_updated=update_resource(resource, account_update_params)

      binding.pry
    if resource_updated

        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render json:{status: :ok,picture: resource.picture, data: resource} }
    else
        format.html { render :new }
        format.json { render json:{status: :error ,data: resource.errors}}
      end
    end
  end

  def destroy

    resource = User.find_for_database_authentication(:email => params[:user][:email])
    binding.pry
    resource.destroy
    respond_to do |format|
      # format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json {  render json:{status: :success, data: resource} }
    end
  end


  protected

  def update_resource(resource, account_update_params)
    resource.update_attributes(account_update_params)
  end  
  
  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:first_name,:last_name,:date,:password,
        :email,:password_confirmation,picture_attributes: [:avatar],:team_items=>[],:basket_items=>[])
    end
    def account_update_params
      params.require(:user).permit(:first_name,:last_name,:date,:password,
        :email,:password_confirmation,picture_attributes: [:avatar],:team_items=>[],:basket_items=>[])
    end
   
end