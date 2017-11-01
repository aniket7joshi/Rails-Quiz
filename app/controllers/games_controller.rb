class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    @genres = Genre.all
    @subgenres = Subgenre.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
       @game = Game.find(params[:id])
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
    @subgenre = Subgenre.new(game_params)
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def submit
        @score = 0
        @game= Game.find(params[:id])

        for i in 0..(showQuestions @game.subgenre_id).length-1

            @correct = true
            if showQuestions(@game.subgenre_id)[i].correct1
                if params[:arr][showQuestions(@game.subgenre_id)[i].id.to_s]['1'].to_i == 0
                    @correct = false
                end
            end
            unless showQuestions(@game.subgenre_id)[i].correct1
                if params[:arr][showQuestions(@game.subgenre_id)[i].id.to_s]['1'].to_i == 1
                    @correct = false
                end
            end
            if showQuestions(@game.subgenre_id)[i].correct2
                if params[:arr][showQuestions(@game.subgenre_id)[i].id.to_s]['2'].to_i == 0
                    @correct = false
                end
            end
            unless showQuestions(@game.subgenre_id)[i].correct2
                if params[:arr][showQuestions(@game.subgenre_id)[i].id.to_s]['2'].to_i == 1
                    @correct = false
                end
            end
            if showQuestions(@game.subgenre_id)[i].correct3
                if params[:arr][showQuestions(@game.subgenre_id)[i].id.to_s]['3'].to_i == 0
                    @correct = false
                end
            end
            unless showQuestions(@game.subgenre_id)[i].correct3
                if params[:arr][showQuestions(@game.subgenre_id)[i].id.to_s]['3'].to_i == 1
                    @correct = false
                end
            end
            if showQuestions(@game.subgenre_id)[i].correct4
                if params[:arr][showQuestions(@game.subgenre_id)[i].id.to_s]['4'].to_i == 0
                    @correct = false
                end
            end
            unless showQuestions(@game.subgenre_id)[i].correct4
                if params[:arr][showQuestions(@game.subgenre_id)[i].id.to_s]['4'].to_i == 1
                    @correct = false
                end
            end
            if @correct
                @score = @score + 10
            end
        end

    end





  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :subgenre_id)
    end
end
