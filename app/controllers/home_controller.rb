class HomeController < ApplicationController
  before_action :brock_current_user, {only:[:top]}
  layout 'home'
  
  def top
  end

  def agreement
  end
end
