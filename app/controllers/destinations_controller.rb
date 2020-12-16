class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def show
    @destinations = Destination.find(params[:id])
  end

end
