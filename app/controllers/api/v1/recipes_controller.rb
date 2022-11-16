class Api::V1::RecipesController < ApplicationController

  def index
    if params[:country] == ""
      render json: {data: []}
    else
      render json: RecipeSerializer.new(RecipeFacade.recipe_search(params[:country]))
    end
  end
end
