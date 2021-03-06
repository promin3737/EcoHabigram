class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
    @user = current_user
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
       redirect_to post_images_path
    else
       @post_images = PostImage.limit(10).order('created_at DESC')
       render :index
    end
  end

  def index
    @post_images = PostImage.limit(10).order('created_at DESC')
  end

  def show
    @post_image = PostImage.find(params[:id])
    @user = @post_image.user
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :caption)
  end

end
