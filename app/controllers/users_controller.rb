class UsersController < ApplicationController
  before_action :user_find, {only:[:show, :edit, :update, :login_form]}
  before_action :brock_not_current_user, {only:[:edit, :update]}
  before_action :uncorrect_user_brock, {only:[:edit, :update]}
  before_action :brock_current_user, {only:[:login, :login_form, :new, :create]}

  def show
    posts = Post.where(user_id: @user.id).order(created_at: 'DESC')
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(5)
    goods = Good.where(user_id: @user.id).order(created_at: 'DESC')
    @goods = Kaminari.paginate_array(goods).page(params[:page]).per(5)
  end

  def edit
  end

  def update
  	@user.name = params[:name]
  	@user.email = params[:email]
  	if @user.save
  		flash[:notice] = "Success!!"
  		redirect_to("/users/#{@user.id}")
  	else
  		render("users/edit")
  	end
  end
  
  def new
  	@user = User.new
  	render :layout => 'home'
  end

  def create
  	pass = (0...8).map{('a'..'z').to_a[rand(26)]}.join
  	@user = User.new(name: params[:name], password: params[:password], email: params[:email], image: params[:image])
  	if @user.save
      @point = Point.new(user_id: @user.id, total: 3)
      @point.save
      flash[:notice] = "Thank you!!"
  		session[:user_id] = @user.id
      redirect_to "/posts/index"
  	else
  		flash[:notice] = "Uncorrect!!"
  		render("users/new", :layout => "home")
  	end
  end

  def login_form
  	render :layout => 'home'
  end

  def login
  	@user = User.find_by(email: params[:email], password: params[:password])
  	if @user
  		session[:user_id] = @user.id
  		flash[:notice] = "Success!!"
  		redirect_to("/posts/index")
  	else
  		flash[:error] = "メールアドレスまたはパスワードが違います。"
  		redirect_to("/login")
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
  	@user = User.find_by(id: params[:id])
  end
end
