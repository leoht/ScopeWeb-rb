class NoticeCategory < ActiveRecord::Base
	has_many :children, class_name: 'NoticeCategory'
	belongs_to :parent, class_name: 'NoticeCategory'

	has_many :notices, inverse_of: :category
end
