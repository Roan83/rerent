class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index,:show]
  def index
    @picture = Picture.all
  end

  def show
    
  end

  def new
    @picture = current_user.pictures.build
  end

  def create
    @picture = current_user.pictures.build(picture_params)

    if @picture.save
      redirect_to @picture, notice: "Successfully added new picture"
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @picture.update(picture_params)
      redirect_to @picture
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to root_path, notci: "Successfully deleted the picture"
  end

  private

  def find_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:title,:description, :image)
  end
end
