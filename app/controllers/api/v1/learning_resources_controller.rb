class Api::V1::LearningResourcesController < ApplicationController

  def index
    if params[:country] == ""
      render json: {data: {}}
    else
      render json: LearningResourceSerializer.new(ResourcesFacade.visual_resources(params[:country]))
    # else
    #   render json: {error: {message: ""}}, status: 400
    end
  end
end
