class NoticeCategory < ActiveRecord::Base
	has_many :children, class_name: 'NoticeCategory', inverse_of: :parent
	belongs_to :parent, class_name: 'NoticeCategory', foreign_key: :parent_id

	has_many :notices, inverse_of: :category
end
