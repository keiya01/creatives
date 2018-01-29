class Comment < ApplicationRecord
	validates :contents, presence: true
	validates :user_id, presence: true
	validates :post_id, presence: true
end
