class SessionsController < ApplicationController

  def create
  	user = User.find_or_create_from_auth(request.env['omniauth.auth'])
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
end
