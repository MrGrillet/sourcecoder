class Company < ApplicationRecord
	validates_uniqueness_of :company_name

	# belongs_to :user
end