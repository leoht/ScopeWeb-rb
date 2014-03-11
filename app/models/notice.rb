class Notice < ActiveRecord::Base
	belongs_to :movie, inverse_of: :notices
	belongs_to :category, class_name: 'NoticeCategory', inverse_of: :notices
	has_and_belongs_to_many :tags
end
