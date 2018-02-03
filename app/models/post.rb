class Post < ApplicationRecord
	validates :title, presence: true
	validates :contents, presence: true
	validates :user_id, presence: true
	belongs_to :user
	has_many :goods, dependent: :destroy
	has_many :comments, dependent: :destroy
end
