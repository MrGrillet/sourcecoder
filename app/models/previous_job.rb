class PreviousJob < ActiveRecord::Base
	belongs_to :profile, optional: true
	has_many :experiences
	has_many :code_languages, through: :experiences
end
