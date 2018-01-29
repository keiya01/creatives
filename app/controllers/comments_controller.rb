class CommentsController < ApplicationController

  def index
  	@comments = Comment.where(post_id: params[:post_id]).order(created_at: 'DESC')
  	@comment = Comment.new
  	render(layout: "posts_head")
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def create
  	@comment = Comment.new(contents: params[:contents], user_id: @current_user.id, post_id: params[:post_id])
  	if @comment.save
  		respond_to do |format|
  			format.html
  			format.js
  		end
  	else
  		render("comments/index")
  	end
  end
 
end
