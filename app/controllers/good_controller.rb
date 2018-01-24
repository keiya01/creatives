class GoodController < ApplicationController
	before_action :pushed_btn_user
  def create
  	@good = Good.new(user_id: @current_user.id, post_id: params[:post_id])
  	
  	if @good_user || @bad_user
   		flash[:notice] = "2回評価することは出来ません。"
   		redirect_to("/posts/index")
  	elsif @good.save
  		flash[:notice] = "成功しました。"
  		redirect_to('/posts/index')
  	else
  		flash[:notice] = "失敗しました。"
  		redirect_to('/posts/index')
  	end
  end
end