class HomeController < ApplicationController
  before_action :brock_current_user
  layout 'home'
  
  def top
  end
end
