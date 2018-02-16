class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :goods, dependent: :destroy
	has_one :point, dependent: :destroy

  def self.find_or_create_from_auth_hash(auth_hash)
   provider = auth_hash[:provider]
   uid = auth_hash[:uid]
   name = auth_hash[:info][:name]
   image_url = auth_hash[:info][:image]

   self.find_or_create_by(provider: provider,uid: uid) do |user|
     user.username = name
     user.image_url = image_url
   end
  end

end