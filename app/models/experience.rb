class Experience < ApplicationRecord
  belongs_to :code_language
  belongs_to :previous_job
end
