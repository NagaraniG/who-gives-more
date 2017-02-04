class AccountInformationsController < ApplicationController
 before_action :set_accountinfo, only: [:show, :edit, :update, :destroy]


  def index
    @accountinformations =AccountInformation.all
  end

  def show
  end
 
  def new
    @accountinformation = AccountInformation.new
  end

  def edit
  end
  
  def create
    @accountinformation = AccountInformation.new(account_params)
    respond_to do |format|
      if @accountinformation.save
        format.html { redirect_to @accountinformation, notice: 'Donation was successfully created.' }
        format.json {  render json:{status: :ok , data: @accountinformation } }
      else
        format.html { render :new }
        format.json { render json:{  status: :error,data: @accountinformation.errors,} }
      end
    end
  end
 
  def update
    respond_to do |format|
      if @accountinformation.update(account_params)
        format.html { redirect_to @accountinformation, notice: 'account was successfully updated.' }
        format.json { render :show, status: :ok, location: @accountinformation }
      else
        format.html { render :edit }
        format.json { render json: @accountinformation.errors, status: :error }
      end
    end
  end
  def destroy
    @accountinformation.destroy
    respond_to do |format|
      format.html { redirect_to account_informations_url, notice: 'account information  was successfully destroyed.' }
      format.json { render json:{status: :delete }}
    end
  end
  private
    def set_accountinfo
      @accountinformation = AccountInformation.where("id=?",params[:id]).first
      unless @accountinformation.present? 
        render json:{ status: :error, data: "accountinformation is not find" }
      end
    end

    def account_params
      params.require(:account_information).permit(:first_name,:last_name,:address1,:address2,:zipcode,:dob,:user_id)
    end
end
