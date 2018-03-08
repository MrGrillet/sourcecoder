class Company < ApplicationRecord
	validates_uniqueness_of :company_name

	belongs_to :user
	validates :user_id, presence: true
	has_many :jobs
end
