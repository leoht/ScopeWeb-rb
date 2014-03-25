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


# SEED NOTICES

movie.notices.create(title: 'Bienvenue', timecode: '7', short_content: 'Ici s\'afficheront les notices documentaires de votre film. Bon visionnage !', content: '')

# IMPACT / CINEMA
movie.notices.create(title: 'Blade Runner', timecode: '1382', short_content: 'Le commissariat de Blade Runner est la copie conforme (angle de vue compris) d’une des tours de Metropolis.', content: '')
movie.notices.create(title: 'Star Wars', timecode: '2400', short_content: 'Le design de C-3PO dans Star Wars possède une troublante ressemblance avec l’androïde.', content: '')
movie.notices.create(title: 'Frankenstein', timecode: '4604', short_content: 'Le laboratoire de Frankenstein est inspiré de celui de Rotwang.', content: '')
movie.notices.create(title: 'Cinquième Element', timecode: '4704', short_content: 'Le laboratoire du Cinquième Element est inspiré de celui de Rotwang.', content: '')
movie.notices.create(title: 'Igor', timecode: '4804', short_content: 'Pour les décors d’Igor (2007), le réalisateur Anthony Leondis déclare avoir été influencé par l’expressionnisme allemand, notamment Metropolis de Fritz Lang, ainsi que par l’univers du Frankenstein de James Whale.', content: '')


movie.related_movies.create(title: 'Star Wars', summary: 'Star Wars', year: 1984)