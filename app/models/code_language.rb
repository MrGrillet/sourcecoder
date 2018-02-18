class CodeLanguage < ActiveRecord::Base
	validates :name, presence: true
	validates_uniqueness_of :name

	has_many :code_languages
	has_many :jobs, through: :code_languages 
end
