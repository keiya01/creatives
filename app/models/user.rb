class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true, format: {with: /\A\S+@\S+\.\S+\z/}
	validates :password, presence: true
end
