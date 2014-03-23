# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movie = Movie.new

movie.title = 'Metropolis'
movie.summary = 'Metropolis résumé'
movie.author = 'Fritz Lang'
movie.year = 1929
movie.file = 'film.mp4'
movie.save

movie.chapters.create(number: 1, title: 'Enfer et Paradis', timecode: '60')
movie.chapters.create(number: 2, title: 'La Révélation', timecode: '572')
movie.chapters.create(number: 3, title: 'Moloch', timecode: '780')

notice = movie.notices.create(title: 'Star Wars', timecode: '8', short_content: 'Star Wars', content: 'Star Wars')

movie.related_movies.create(title: 'Star Wars', summary: 'Star Wars', year: 1984)