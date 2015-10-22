class BandsController < ApplicationController

  def index
    render :index
  end

  def show
    render :show
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

end
