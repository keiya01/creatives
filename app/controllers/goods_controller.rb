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
      format.html{redirect_to "/posts/index"}
     elsif @remove_point.total >= 1
      @good.save
      @remove_point.total -= 1
      if @remove_point.save
        @add_point.total += 1
        if @add_point.save
          NoticeMailer.good_notice(@user, @post).deliver
          format.html{ redirect_to '/posts/index'}
          format.js
        else
          flash[:notice] = "エラーが発生しました。"
          format.html{redirect_to "/posts/index"}
        end
      else
        flash[:notice] = "エラーが発生しました。"
        format.html{redirect_to "/posts/index"}
      end
     else
      flash[:notice] = "エラーが発生しました。"
      format.html{redirect_to "/posts/index"}
  	 end
    end
  end

private

  def pushed_good_user
    @good_user = Good.find_by(user_id: @current_user.id, post_id: params[:post_id])
    @post = Post.find_by(id: params[:post_id])
  end
end