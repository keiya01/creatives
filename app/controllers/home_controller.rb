class HomeController < ApplicationController
  before_action :brock_current_user, {only:[:top]}
  layout 'home'

  def top
  end

  def agreement
  end

  def how_to_use
  end

  def new_user
  	if session[:new_user]
  	  session[:new_user] = nil
  	  redirect_to '/posts/index', notice: "Thank You !!"
  	else
  	  redirect_to '/posts/index'
  	end
  end
end
