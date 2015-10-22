class AlbumsController < ApplicationController

  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.create(album_params)

    if @album.save
      render :show
    else
      flash[:notice] = @album.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end

  private

  def album_params
    params.require(:album).permit(:title, :recording, :band_id)
  end

end
