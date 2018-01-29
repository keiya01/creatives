class GoodsController < ApplicationController
	before_action :pushed_good_user

  def create
  	@good = Good.new(user_id: @current_user.id, post_id: params[:post_id])
  	if @good_user
   		flash[:notice] = "2回評価することは出来ません。"
   		redirect_to("/posts/#{params[:post_id]}")
  	elsif @good.save
  		flash[:notice] = "成功しました。"
      redirect_to("/posts/#{params[:post_id]}")
  	else
  		flash[:notice] = "失敗しました。"
  	 	redirect_to("/posts/#{params[:post_id]}")
  	end
  end

  def destroy
    if @good_user.destroy
      flash[:notice] = "成功"
      redirect_to("/posts/#{params[:post_id]}")
    end
  end

  private

  def pushed_good_user
    @good_user = Good.find_by(user_id: @current_user.id, post_id: params[:post_id])
  end

end