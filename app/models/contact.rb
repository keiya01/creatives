class Contact < ApplicationRecord
	validates :contents, presence: true
	validates :user_id, presence: true
end
