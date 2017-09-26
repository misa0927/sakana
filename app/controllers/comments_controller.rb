class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @recipe = @comment.recipe

    respond_to do |format|
      if @comment.save
        format.html{ redirect_to recipe_path(@recipe), notice:'コメントを投稿しました'}
        format.js { render :index }
      else
        format.html {render :new }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js {render :index}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:recipe_id, :content)
  end
end
