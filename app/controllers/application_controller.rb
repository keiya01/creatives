class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  def set_current_user
  	@current_user = User.find_by(id: session[:user_id])
  end

  def brock_not_current_user
  	unless @current_user
  		flash[:notice] = "ログインまたは新規登録をしてください。"
  		redirect_to("/")
  	end
  end

  def brock_current_user
  	if @current_user
  		flash[:notice] = "すでにログインしています。"
  		redirect_to("/posts/index")
  	end
  end

  def pushed_btn_user
  	@good_user = Good.find_by(user_id: @current_user.id, post_id: params[:post_id])
  	@bad_user = Bad.find_by(user_id: @current_user.id, post_id: params[:post_id])
  end
end
