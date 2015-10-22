class TracksController < ApplicationController

  def new

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

end
