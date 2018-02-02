class PostsController < ApplicationController
  before_action :brock_not_current_user, {only:[:new,:create]}
  before_action :post_find, {only:[:show]}
  before_action :post_time, {only:[:new, :create]}


  def index
  	@posts = Post.page(params[:page]).per(5).order(created_at: 'DESC')
  end

  def search
    @posts = Post.page(params[:page]).per(5).where('contents LIKE(?)', "%#{params[:search]}%").order(created_at: 'DESC')
  end

  def show
    render(layout: "posts_head")
    respond_to do |format|
        format.html
        format.js
      end
  end

  def new
  	@post = Post.new
    render(layout: nil)
    respond_to do |format|
        format.html
        format.js
      end
  end

  def create
  	@post = Post.new(title: params[:title], contents: params[:contents], user_id: @current_user.id)
  	if  !@post_time.blank?
  		flash[:notice] = "次の投稿は#{@next_post}から可能です。"
  		redirect_back(fallback_location: "/posts/index")
  	elsif @post.save
  		flash[:notice] = "Success!!"
  		redirect_back(fallback_location: "/posts/index")
  	end
  end

  private

  def post_find
  	@post = Post.find_by(id: params[:id])
  end

  def post_time
  	@range = Date.today.beginning_of_day..Date.today.end_of_day
  	@end_time = Date.today.end_of_day + 1
  	@next_post = @end_time.strftime("%Y-%m-%d(%H:%M)")
  	@post_time = Post.where(user_id: @current_user.id, created_at: @range)
  end
end
