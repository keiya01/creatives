class UsersController < ApplicationController
  before_action :user_find, {only:[:show, :edit, :update, :login_form, :destroy]}
  before_action :brock_not_current_user, {only:[:edit, :update, :logout, :destroy]}
  before_action :uncorrect_user_brock, {only:[:edit, :update]}
  before_action :brock_current_user, {only:[:create]}

  def show
    posts = Post.where(user_id: @user.id).order(created_at: 'DESC')
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(10)
    post_goods = Post.joins(:goods).where(goods: {user_id: @user.id}).order(created_at: 'DESC')
    @goods = Kaminari.paginate_array(post_goods).page(params[:page]).per(10)
  end

  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    if user
      if !Point.find_by(user_id: user.id)
        @point = Point.new(user_id: user.id, total: 3)
        @point.save
      end
      session[:user_id] = user.id
      redirect_to '/posts/index', notice: "ログインしました。"
    else
      redirect_to root_path, notice: "失敗しました。"
    end
  end

  def edit
  end

  def update
    if @user
      @user.username = params[:name]
      @user.image_url = params[:image]
      redirect_to("/users/#{@user.id}", notice: "編集しました。") if @user.save
    end
  end

  def destroy
    if @current_user
      if @current_user.destroy
        session[:user_id] = nil
        redirect_to('/', notice: "ありがとうございました。")
      end
    end
  end

  def logout
    @user = User.find_by(id: session[:user_id])
    if @user
     session[:user_id] = nil
     flash[:notice] = "Good bye."
     redirect_to('/')
    end
  end

private

  def uncorrect_user_brock
    unless @current_user.id == @user.id
      flash[:notice] = "権限がありません。"
      redirect_to("/posts/index")
    end
  end

  def user_find
  	@user = User.find(params[:id])
  end
end
