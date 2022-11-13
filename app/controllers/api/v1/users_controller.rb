class Api::V1::UsersController < ApplicationController


  def create
    user = User.new(user_params)

    if User.find_by(email: user.email).present?
      render json: {errors: { message: "Email already exisits"}}, status: 400
    elsif !params[:email].present? || !params[:name].present?
      render json: {errors: { message: "All fields are required"}}, status: 400
    else
      user.save
      render json:UserSerializer.new(user)
    end
  end
  #   user = User.create(user_params)
  #
  #   if user.save
  #     render json: UserSerializer.new(user), status: :created
  #   else
  #     render json: {errors: { message: "user not created"}}, status: :not_found
  #   end
  # end

  private

  def user_params
    params.permit(:name, :email)
  end
end
