class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :is_user?, only: [:index, :show]

  def index

  end

  def show
    @user = User.find(params[:id])
  end

  private

  def is_user?
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:danger] = "action impossible !"
      redirect_to "/"
    end
  end
end
