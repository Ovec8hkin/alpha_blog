class CommentsController < ApplicationController

  def new
    @comment = Comment.new(article_id: params[:article_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @article = @comment.article
    if @comment.save
      flash[:success] = "Your comment was posted succesfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :article_id)
  end

end