class Api::V1::FavoritesController < ApplicationController


  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: {errors: { message: "api key not vaild"}}, status: 401
    else
      FavoriteSerializer.new(user.favorites.create(fav_params))
      render json: {success: { message: "Favorite added successfully"}}, status: 201 
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: {errors: { message: "api key not vaild"}}, status: 401
    else
      favs = user.favorites
        if favs.nil?
          render json: {data: []}
        else
          render json: FavoriteSerializer.new(favs)

      end
    end
  end

  private

  def fav_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end
