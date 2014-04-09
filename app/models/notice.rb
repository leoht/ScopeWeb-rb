class Notice < ActiveRecord::Base
	belongs_to :movie, inverse_of: :notices
	belongs_to :category, class_name: 'NoticeCategory', inverse_of: :notices, foreign_key: 'notice_category_id'
	has_and_belongs_to_many :tags
	has_and_belongs_to_many :users
end
