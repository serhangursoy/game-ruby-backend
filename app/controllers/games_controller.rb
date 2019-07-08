class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, except: []


  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    if @game.save
      render json: { status: "success", message: "Game created successfully!", data:@game}, status: :ok
    else
      render json: { status: "error",message:"Sad error"}
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
      if @game.update(game_params)
        render json: { status: "success", message: "Game updated successfully!", data:@game}, status: :ok
      else
        render json: { status: "error",message:"Sad error"}
      end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # No need for that
  def socket
    @game = Game.find(params[:id])
    render json: { data: @game }
  end

  def getUserGames
    @owned_games   = Game.find_by_p1(params[:id])
    @invited_games = Game.find_by_p2(params[:id])
    render json: { owned_games: @owned_games, invited_games: @invited_games }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:table, :p1, :p2, :title)
    end
end
