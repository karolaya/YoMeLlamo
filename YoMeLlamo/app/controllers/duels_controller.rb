class DuelsController < ApplicationController
  before_action :set_duel, only: [:show, :edit, :update, :destroy, :addvote, :finishDuel]

  # GET /duels
  # GET /duels.json
  def index
    @duels = Duel.all
  end

  # GET /duels/1
  # GET /duels/1.json
  def show
    @singer1 = Singer.find(@duel.singer1_id)
    @singer2 = Singer.find(@duel.singer2_id)
    @song1 = Song.find(@duel.song1_id)
    @song2 = Song.find(@duel.song2_id)
  end

  # GET /duels/new
  def new    
    @query = Singer.limit(2).order("RANDOM()")
    @singer1 = @query.first
    @singer2 = @query.last
    @song1 = @singer1.songs.limit(1).order("RANDOM()").first
    @song2 = @singer2.songs.limit(1).order("RANDOM()").first
    @duel = Duel.new({"singer1_id" => @singer1.id, "singer2_id" => @singer2.id, "song1_id" => @song1.id, "song2_id" => @song2.id, "votes1" => 0, "votes2" => 0})
    @duel.finished = false
    respond_to do |format|
      if @duel.save
        format.html { redirect_to @duel, notice: 'Duel was successfully created.' }
        format.json { render :show, status: :created, location: @duel }
      else
        format.html { render :new }
        format.json { render json: @duel.errors, status: :unprocessable_entity }
      end
    end
  end

  def addvote
    respond_to do |format|
      if not @duel.finished?
        if params[:vote] == "1"
          @duel.update({"votes1" => @duel.votes1 + 1})
        elsif params[:vote] == "2"
          @duel.update({"votes2" => @duel.votes2 + 1})
        end
        format.html { redirect_to duels_path }
      else 
        format.html { redirect_to duels_path, notice: 'Sorry, this duel has been finished' }
      end
      end
  end

  def finishDuel
    respond_to do |format|
      @duel.update({"finished" => true})
            
      format.html { redirect_to duels_path }
    end
  end

  # GET /duels/1/edit
  def edit
  end

  # POST /duels
  # POST /duels.json
  def create
    @duel = Duel.new(duel_params)

    respond_to do |format|
      if @duel.save
        format.html { redirect_to @duel, notice: 'Duel was successfully created.' }
        format.json { render :show, status: :created, location: @duel }
      else
        format.html { render :new }
        format.json { render json: @duel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /duels/1
  # PATCH/PUT /duels/1.json
  def update
    respond_to do |format|
      if @duel.update(duel_params)
        format.html { redirect_to @duel, notice: 'Duel was successfully updated.' }
        format.json { render :show, status: :ok, location: @duel }
      else
        format.html { render :edit }
        format.json { render json: @duel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /duels/1
  # DELETE /duels/1.json
  def destroy
    @duel.destroy
    respond_to do |format|
      format.html { redirect_to duels_url, notice: 'Duel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_duel
      @duel = Duel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def duel_params
      params.require(:duel).permit(:singer1_id, :singer2_id)
    end
end
