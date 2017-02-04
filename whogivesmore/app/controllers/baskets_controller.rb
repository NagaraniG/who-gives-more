class BasketsController < ApplicationController
  before_action :require_login?
  before_action :set_basket, only: [:show, :edit, :update, :destroy]
# before_action :authenticate
  # skip_before_action :require_login?

  def index
    @baskets =Basket.all
    @pictures=Picture.all
    #@picture=@basket.pictures
  end

  def show
   @picture=@basket.picture
  end
 
  def new
    @basket = Basket.new
    @basket.build_picture
  end
  
  def edit
  end
  
  def create
    @basket = Basket.new(basket_params)
    # binding.pry
      respond_to do |format|
      if @basket.save
        format.html { redirect_to @basket, notice: 'basket was successfully created.' }
        format.json {  render json:{status: :ok,data: @basket } }
      else
        format.html { render :new }
        format.json { render json:{status: :error,data: @basket.errors }}
      end
    end
  end
 
  def update
    respond_to do |format|
      if @basket.update(basket_params)
        format.html { redirect_to @basket, notice: 'basket was successfully updated.' }
        format.json { render :show, status: :ok, data: @basket ,location: @basket}
      else
        format.html { render :edit }
        format.json { render json:{ status: :error,data: @basket.errors } }
      end
    end
  end
 
  def destroy
    @basket.destroy
    respond_to do |format|
      format.html { redirect_to baskets_url, notice: 'basket was successfully destroyed.' }
      format.json { render json:{status: :delete }}
    end
  end

  private
    def set_basket
      @basket = Basket.where("id=?",params[:id]).first

      unless @basket.present? 
        render json:{ status: :error, data: "basket is not find" }

      end
    end

    def basket_params
      params.require(:basket).permit(:name,:custom,
        :percentage,picture_attributes: [:avatar])
    end
end
