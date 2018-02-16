class User < ApplicationRecord
	mount_uploader :image_url, ImageUploader
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :goods, dependent: :destroy
	has_one :point, dependent: :destroy

  def self.find_or_create_from_auth_hash(auth_hash)
  　provider = auth_hash[:provider]
  　uid = auth_hash[:uid]
  　nickname = auth_hash[:info][:nickname]
  　image_url = auth_hash[:info][:image]
  　name = auth_hash[:info][:name]

  　User.find_or_create_by(provider: provider,uid: uid) do |user|
   　　user.nickname = nickname
   　　user.image_url = image_url
     user.name = name
   end
  end

end
