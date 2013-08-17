class Daily < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at ASC') }
	validates :user_id, presence: true
	validates :report_for, uniqueness: true
end
