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
end
