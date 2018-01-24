class Post < ApplicationRecord
	validates :title, presence: true
	validates :contents, presence: true
	validates :user_id, presence: true
end
