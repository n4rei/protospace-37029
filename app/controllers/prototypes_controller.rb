class PrototypesController < ApplicationController
before_action :authenticate_user!, only: [:new, :edit, :destroy]
before_action :edit_redirect_root, only: [:edit]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      @prototype.save
      render "new"
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      @prototype.update(prototype_params)
      render "edit"
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end



  private
  def prototype_params
    params.require(:prototype).permit(:title, :image, :concept, :catch_copy).merge(user_id: current_user.id)
  end

  def edit_redirect_root
    @prototype = Prototype.find(params[:id])
    if unless current_user.id == @prototype.user_id
      redirect_to action: :index
    end
    else
    end
  end
end
