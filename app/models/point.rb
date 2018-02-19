class Point < ApplicationRecord
	validates :total, presence: true
	validates :user_id, presence: true
	belongs_to :user
end
