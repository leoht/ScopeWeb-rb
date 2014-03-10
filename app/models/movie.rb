class Movie < ActiveRecord::Base
	has_many :notices, inverse_of: :movie
	has_many :comments, inverse_of: :movie
	has_and_belongs_to_many  :related_movies
	has_and_belongs_to_many  :related_facts, class_name: 'MovieRelatedFact'
end
