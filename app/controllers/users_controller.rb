class UsersController < ApplicationController
  before_action :user_find, {only:[:show, :edit, :update, :login_form]}
  before_action :brock_not_current_user, {only:[:edit, :update]}
  before_action :uncorrect_user_brock, {only:[:edit, :update]}
  before_action :brock_current_user, {only:[:login, :login_form, :new, :create]}

  def show
    posts = Post.where(user_id: @user.id).order(created_at: 'DESC')
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(10)
    post_goods = Post.joins(:goods).where(goods: {user_id: @user.id}).order(created_at: 'DESC')
    @goods = Kaminari.paginate_array(post_goods).page(params[:page]).per(10)
  end

  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    if user
      @point = Point.new(user_id: user.id, total: 3)
      @point.save
      session[:user_id] = user.id
      redirect_to root_path, notice: "ログインしました。"
    else
      flash[:notice] = "Uncorrect!!"
      render("users/new", :layout => "home")
    end
  end

  def edit
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
  	@user = User.find_by(id: params[:id])
  end
end
