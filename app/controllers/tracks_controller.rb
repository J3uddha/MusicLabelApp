class TracksController < ApplicationController

  def new
    @track = Track.new
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.create(track_params)

    if @track.save
      render :show
    else
      flash[:notice] = @track.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id)
  end

end
