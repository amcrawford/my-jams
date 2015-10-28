class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)   # Rails is smart enough to also do redirect_to @song
    else
      flash.now[:errors] = "Must enter a title and artist."
      render :new
    end
  end

  def edit
  end

  def update
   if @song.update(song_params)
     redirect_to song_path(@song)
   else
     flash.now[:errors] = @song.errors.full_messages.join(", ")
     render :edit
   end
 end

 def destroy
   song = Song.find(params[:id])
   song.destroy
   redirect_to songs_path
 end

 def set_song
   @song = Song.find(params[:id])
 end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

end
