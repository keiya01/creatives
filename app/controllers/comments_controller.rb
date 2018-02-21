class CommentsController < ApplicationController

  def create
  	@comment = Comment.new(contents: params[:contents], user_id: @current_user.id, post_id: params[:post_id])
  	@comments = Comment.where(post_id: params[:post_id]).order(created_at: 'ASC')
    respond_to do |format|
  	 if @comment.save
  			format.html
  			format.js
  	 else
  	  	format.js
  	 end
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:post_id])
    @comments = Comment.where(post_id: @comment.post_id).order(created_at: 'ASC')
    respond_to do |format|
     if @comment.destroy
      format.html{redirect_to("/posts/index", notice: "削除しました。")}
      format.js
     end
    end
  end

end
