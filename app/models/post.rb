class Post < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates :title, presence: true
	validates :contents, presence: true
	validates :user_id, presence: true
	belongs_to :user
	has_many :goods, dependent: :destroy
	has_many :comments, dependent: :destroy

	def comments_count
		return Comment.where(post_id: self.id).count
	end

	def goods_count
		return Good.where(post_id: self.id).count
	end
end
