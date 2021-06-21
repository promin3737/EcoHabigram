class LikesController < ApplicationController
  def create
    @post_image = PostImage.find(params[:post_image_id])
    @like = current_user.likes.new(like_params)
    @like.save
  end


  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    @like = Like.find_by(id: params[:id])
    @like.destroy
  end

  private
    def like_params
      params.permit(:post_image_id)
    end
end
