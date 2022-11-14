class Api::V1::UsersController < ApplicationController


  def create
    user = User.new(user_params)
    if User.find_by(email: user.email).present?
      render json: {errors: { message: "Email already exists"}}, status: 400
    elsif !params[:email].present? || !params[:name].present?
      render json: {errors: { message: "All fields are required"}}, status: 400
    else
      user.save
      render json:UserSerializer.new(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
