class User < ApplicationRecord
	mount_uploader :image_url, ImageUploader
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true, format: {with: /\A\S+@\S+\.\S+\z/}
	validates :password, presence: true
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :goods, dependent: :destroy
	has_one :point, dependent: :destroy

  def self.find_or_create_from_auth(auth_hash)
  　provider = auth_hash[:provider]
  　uid = auth_hash[:uid]
  　nickname = auth_hash[:info][:nickname]
  　image_url = auth_hash[:info][:image]

  　self.find_or_create_by(provider: provider, uid: uid) do |user|
   　　user.nickname = nickname
   　　user.image_url = image_url
 　　end
  end
end

end
