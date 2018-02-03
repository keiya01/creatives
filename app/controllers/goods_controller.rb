class GoodsController < ApplicationController
  before_action :pushed_good_user

  def create
  	@good = Good.new(user_id: @current_user.id, post_id: params[:post_id])
    @post = Post.find_by(id: params[:post_id])
    @user = User.find_by(id: @post.user_id)
    @remove_point = Point.find_by(user_id: @current_user.id)
    @add_point = Point.find_by(user_id: @user.id)
    respond_to do |format|
  	 if @good_user
      format.js
     elsif @remove_point.total == 0
      flash[:notice] = "ポイントが足りません。"
      redirect_to "/posts/index"
     elsif @remove_point.total >= 1
      @good.save
      @remove_point.total -= 1
      if @remove_point.save
        @add_point.total += 1
        @add_point.save
        format.js
      else
        flash[:notice] = "エラーが発生しました。"
        redirect_to "/posts/index"
      end
     else
      flash[:notice] = "エラーが発生しました。"
      redirect_to "/posts/index"
  	 end
    end
  end

  def destroy
    respond_to do |format|
      if @good_user
        @good_user.destroy
        format.js
      else
        format.js
      end
    end
  end

  def pushed_good_user
    @good_user = Good.find_by(user_id: @current_user.id, post_id: params[:post_id])
    @post = Post.find_by(id: params[:post_id])
  end

end