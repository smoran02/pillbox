class Daily < ActiveRecord::Base
	validates :user_id, presence: true
end
