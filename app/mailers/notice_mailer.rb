class NoticeMailer < ApplicationMailer

	def greeting(user)
		@user = user
		mail to: user.email,
			 subject: "ユーザー情報を変更しました！"
	end

    def good_notice(user, post)
    	@user = user
    	@post = post
    	mail to: user.email,
    		 subject: "あなたの投稿にグッドボタンが押されました！"
    end

    def comment_notice(user, post)
    	@user = user
    	@post = post
    	mail to: user.email,
    		 subject: "あなたの投稿にコメントが投稿されました！"
    end
end
