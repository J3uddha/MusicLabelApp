class BandsController < ApplicationController

  def index
    @band_and_albums = Band.inlcudes(:albums)
    # @band_and_albums = Hash.new { |h,k| h[k]=[] }
    # Album.all.each do |album|
    #   @band_and_albums[album.band_id] << album
    # end
    render :index
  end

  def show
    render :show
  end

  def new
    render :new
  end

  def create
    @band = Band.create(band_params)

    if @band.save
      render :show
    else
      flash[:notice] = @band.errors.full_messages
      render :new
    end
  end

  private

  def band_params
    params.require(:band).permit(:alias)
  end

end
