class PreviousJob < ActiveRecord::Base
	belongs_to :profile, optional: true

end
