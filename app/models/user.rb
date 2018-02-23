class User < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  validates :provider, presence: true
  validates :uid, presence: true
  validates :username, presence: true
  validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, allow_blank: true
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :goods, dependent: :destroy
	has_one :point, dependent: :destroy, class_name: "Point"

  def self.find_or_create_from_auth_hash(auth_hash)
   provider = auth_hash[:provider]
   uid = auth_hash[:uid]
   name = auth_hash[:info][:name]
   self.find_or_create_by(provider: provider,uid: uid) do |user|
     user.username = name
   end
  end

end