class CommentsController < ApplicationController

  def create
  	@comment = Comment.new(contents: params[:contents], user_id: @current_user.id, post_id: params[:post_id])
    @post = Post.find_by(id: @comment.post_id)
    @user = User.find_by(id: @post.user_id)
  	@comments = Comment.where(post_id: params[:post_id]).order(created_at: 'ASC')
    respond_to do |format|
  	 if @comment.save
        NoticeMailer.comment_notice(@user, @post).deliver_now if @user.id != @current_user.id
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
      format.html{redirect_to("/", notice: "削除しました。")}
      format.js
     end
    end
  end

end
