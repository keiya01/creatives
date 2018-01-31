class GoodsController < ApplicationController
  before_action :pushed_good_user

  def create
  	@good = Good.new(user_id: @current_user.id, post_id: params[:post_id])
    respond_to do |format|
  	 if @good_user
      format.js
     else
      @good.save
      format.js
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