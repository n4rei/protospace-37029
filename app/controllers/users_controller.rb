class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      @user = User.save(user_params)
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
  end
end

private
  def user_params
    params.require(:user).permit(:email, :password, :name, :profile, :occupation, :position).merge(prototype_id: params[:prototype_id])
  end

