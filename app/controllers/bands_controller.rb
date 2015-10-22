class BandsController < ApplicationController

  def index
    @bands = Band.all
    @band_and_albums = Hash.new { |h,k| h[k]=[] }

    @bands.each do |band|
      @band_and_albums[band] << Album.find_by_band_id(band.id)
    end
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
