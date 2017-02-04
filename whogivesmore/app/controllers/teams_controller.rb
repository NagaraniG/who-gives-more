class TeamsController < ApplicationController
  before_action :require_login?
  before_action :set_team, only: [:show, :edit, :update, :destroy]
# before_action :authenticate
  # skip_before_action :require_login?

  def index
    @teams =Team.all
    @competitionteams=CompetitionTeam.all
    @competitions=Competition.all
    @picture=Picture.all

  end

  def show
     @picture=@team.picture
  end
 
  def new
    @team = Team.new
    @competition=Competition.pluck(:id,:name)
  @team.build_picture
  @team.donations.build
  end
 
  def edit
  end
  
  def create
    @team = Team.new(team_params)
    # @team.competitions<<Competition.find(params[:competition_id])
    #@team.competitions.build
     binding.pry
      respond_to do |format|
        
      if @team.save
        format.html { redirect_to @team, notice: 'team was successfully created.' }
        format.json {  render json:{status: :ok,data: @team } }
      else
        format.html { render :new }
        format.json { render json:{status: :error,data: @team.errors }}
      end
    end
  end

 
  def update
    respond_to do |format|
      binding.pry
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, data: @team ,location: @team}
      else
        format.html { render :edit }
        format.json { render json:{ status: :error,data: @team.errors } }
      end
    end
  end

 
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'team was successfully destroyed.' }
      format.json { render json:{status: :delete }}
    end
  end

  # protected
  # def authenticate
  #    authenticate_or_request_with_http_token do |token, options|
  #     User.find_by(auth_token: auth_token)
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.where("id=?",params[:id]).first

      unless @team.present? 
        render json:{ status: :error, data: "team is not find" }

      end
    end

    def team_params
      params.require(:team).permit(:name,:description,:competition_ids,picture_attributes: [:avatar,:imageble_type,:imageble_id,:avatar_file_name,:avatar_content_type,:avatar_file_size])
    end
end
