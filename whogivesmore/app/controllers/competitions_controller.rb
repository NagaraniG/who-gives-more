class CompetitionsController < ApplicationController
 before_action :set_competition, only: [:show, :edit, :update, :destroy]

  def index
    @competitions =Competition.all
  end
  
  def show
  end

  def new
    @competition = Competition.new
  end

  def edit
  end

  def create
    @competition = Competition.new(competition_params)
    binding..pry
    respond_to do |format|
      if @competition.save
        format.html { redirect_to @competition, notice: 'competition was successfully created.' }
        format.json { render json:{  status: :ok,data: @competition, }  }
      else
        format.html { render :new }
        format.json { render json:{status: :error,data: @competition.errors } }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to @competition, notice: 'competition was successfully updated.' }
        format.json { render json:{status: :ok , data: @competition}   }
      else
        format.html { render :edit }
        format.json { render json:{status: :error,data: @competition.errors }}
      end
    end
  end

 
  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url, notice: 'Competition was successfully destroyed.' }
      format.json { render json:{status: :delete }}
    end
  end

  private
    def set_competition
       @competition = Competition.where("id=?",params[:id]).first

      unless @competition.present? 
        render json:{ status: :error, data: "competition is not find" }

      end
    end
  
    def competition_params
      params.require(:competition).permit(:name,:end_date,:ranking_type,:no_end_date,:team_ids)
    end
end
