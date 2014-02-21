class Movie < ActiveRecord::Base
	has_many :notices
end
