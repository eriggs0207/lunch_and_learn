class Api::V1::UsersController < ApplicationController
   

  def create
    user = User.create(user_params)

    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: {errors: { message: "user not created"}}, status: :not_found
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
