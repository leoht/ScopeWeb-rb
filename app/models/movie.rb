class Movie < ActiveRecord::Base
	has_many :notices
	has_many :comments
end
