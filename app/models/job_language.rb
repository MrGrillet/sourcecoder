class JobLanguage < ApplicationRecord
	belongs_to :job 
	belongs_to :code_language
end