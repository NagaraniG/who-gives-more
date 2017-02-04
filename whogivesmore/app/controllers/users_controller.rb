class UsersController < ApplicationController
  
  before_action :set_id ,only: [:show,:edit,:update,:destroy]

  def index
    @donations=Donation.all
    @teams=Team.all
    @competitions=Cometition.all


  end

  def show

  end

  def new
    @user=User.new
  end

  def edit
  
  end

 def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user, notice: 'Your were successfully enterd next join any one or more team.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Your were successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Your were successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_id
      @user = User.find(params[:id])
    end
end
