class PostsController < ApplicationController
  before_action :brock_not_current_user, {only:[:new,:create]}
  before_action :post_find, {only:[:show,:edit,:update]}
  before_action :post_time, {only:[:new, :create]}


  def index
  	@posts = Post.page(params[:page]).per(15).order(created_at: "DESC")
  end

  def show
    @comments = Comment.where(post_id: @post.id).order(created_at: 'ASC')
    render(layout: "posts_head")
    respond_to do |format|
        format.html
        format.js
      end
  end

  def rank
    @ranks = Post.find(Good.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
  end

  def new
  	@post = Post.new
    render(layout: "posts_head")
    respond_to do |format|
        format.html
        format.js
      end
  end

  def create
  	@post = Post.new(title: params[:title], contents: params[:contents], user_id: @current_user.id, image: params[:image], image_cache: params[:image_cache])
  	if  !@post_time.blank?
  		flash[:notice] = "次の投稿は#{@next_post}から可能です。"
  		redirect_to("/posts/index")
  	elsif @post.save
  		flash[:notice] = "Success!!"
  		redirect_to("/posts/index")
    else
      render "posts/new", layout:"posts_head"
    end
  end

  def edit
    render(layout: "posts_head")
    respond_to do |format|
        format.html
        format.js
      end
  end

  def update
    @post.title = params[:title]
    @post.contents = params[:contents]
    if @post.save
      redirect_to '/posts/index', notice: "編集しました。"
    else
      render partial: 'posts/edit'
    end
  end

  private

  def post_find
  	@post = Post.find(params[:id])
  end

  def post_time
  	@range = Date.today.beginning_of_day..Date.today.end_of_day
  	@end_time = Date.today.end_of_day + 1
  	@next_post = @end_time.strftime("%Y-%m-%d(%H:%M)")
  	@post_time = Post.where(user_id: @current_user.id, created_at: @range)
  end
end
