class Comment < ActiveRecord::Base
	belongs_to :movie, inverse_of: :comments
	belongs_to :user,  inverse_of: :comments
end
