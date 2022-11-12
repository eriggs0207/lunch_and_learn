class Api::V1::RecipesController < ApplicationController

  def index
    render json: RecipeSerializer.new(RecipeFacade.recipe_search(params[:country]))
  end
end
