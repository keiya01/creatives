class User < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true, format: {with: /\A\S+@\S+\.\S+\z/}
	validates :password, presence: true
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :goods, dependent: :destroy
	has_one :point, dependent: :destroy
end
