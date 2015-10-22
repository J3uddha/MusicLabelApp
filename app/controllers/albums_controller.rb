class AlbumsController < ApplicationController

  def new
    @album = Album.new
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

end
