class Api::V1::TouristSightsController < ApplicationController

  def index
    if params[:country] == ""
      render json: {data: []}
    else
      render json: TouristSightSerializer.new(TouristSightsFacade.find_attractions(params[:country]))
    end
  end
end
