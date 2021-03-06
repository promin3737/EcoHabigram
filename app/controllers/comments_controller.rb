class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post_image = @comment.post_image
    if @comment.save
      respond_to :js
    else
      flash[:alert] = "コメントに失敗しました"
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @post_image = @comment.post_image
    if @comment.destroy
      respond_to :js
    else
      flash[:alert] = "コメントの削除に失敗しました"
    end
  end

  private
    def comment_params
      params.required(:comment).permit(:user_id, :post_image_id, :comment)
    end
end
