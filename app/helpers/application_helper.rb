module ApplicationHelper

	def simple_time(time)
		time.strftime("%Y-%m-%d　%H:%M　")
	end 

	require "uri"

	def text_url_to_link(text)
  		URI.extract(text, ['http','https']).uniq.each do |url|
    		sub_text = link_to url, url, target: '_blank'

		    text.gsub!(url, sub_text)
	  	end

  		return text
	end

	def get_twitter_card_info(page)
      twitter_card = {}
      if page
        twitter_card[:url] = "https://www.yapy.fun/posts/#{page.id}"
        twitter_card[:title] = 'Yapy「面白いアイディア発見」'
        twitter_card[:description] = "タイトル：#{page.title}"
        twitter_card[:image] = "#{assets_url("yapy_logo.jpg")}"
      else
        twitter_card[:url] = 'https://www.yapy.fun'
        twitter_card[:title] = 'アイデア実現のためのSNS「Yapy」'
        twitter_card[:description] = 'あなたのアイディアをあえて公開してみましょう！'
        twitter_card[:image] = "#{assets_url("yapy_logo.jpg")}"
      end
      twitter_card[:card] = 'summary'
      twitter_card[:site] = '@Yapy_service'
      twitter_card
  	end
end
