class DonationsController < ApplicationController
   before_action :set_donation, only: [:show, :edit, :update, :destroy]
# skip_before_action :require_login?

  def index
    @donations =Donation.all
     @highest_donor=Donation.order('amount DESC').limit(3)
  end

  def show
  end

  def new
    @donation = Donation.new
  end
  
  def edit
  end
  
  def create
    @donation = Donation.new(donation_params)
    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        format.json { render json:{ status: :ok, data: @donation }   }
      else
        format.html { render :new }
        format.json { render json:{ status: :error, data: @donation.errors } }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'donation was successfully updated.' }
        format.json { render json:{status: :ok, data: @donation}  }
      else
        format.html { render :edit }
        format.json { render json:{status: :error,data: @donation.errors }}
      end
    end
  end

 
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'donation was successfully destroyed.' }
      format.json { render json:{status: :delete }}
    end
  end

  private
    def set_donation
       @donation = Donation.where("id=?",params[:id]).first
      unless @donation.present? 
        render json:{ status: :error, data: "donation is not find" }
      end
    end
    def donation_params
      params.require(:donation).permit(:firstname_on_card,:lastname_on_card,:card_number,:expiration_date,:cvv,:billing_address,:amount,:user_id,:team_id)
    end
end
