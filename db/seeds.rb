# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Metropolis

movie = Movie.new

movie.title = 'Metropolis'
movie.summary = 'Metropolis résumé'
movie.author = 'Fritz Lang'
movie.year = 1929
movie.file = 'metropolis.mp4'
movie.save

# Related movies

RelatedMovie.create(title: 'Inglorious Basterds', image: 'poster-inglorious.jpg', year: '2011')
RelatedMovie.create(title: 'Le Cinquième Element', image: 'poster-5e-element.jpg', year: '1997')

# movie.chapters.create(number: 1, title: 'Enfer et Paradis', timecode: '60')
# movie.chapters.create(number: 2, title: 'La Révélation', timecode: '572')
# movie.chapters.create(number: 3, title: 'Moloch', timecode: '780')

# SEED NOTICES CATEGORIES FIRST LEVEL
impact_category = NoticeCategory.create(title: 'Impact sur la culture populaire', nicename: 'impact')
themes_category = NoticeCategory.create(title: 'Thèmes clés', nicename: 'themes')
anecdotes_category = NoticeCategory.create(title: 'Anecdotes', nicename: 'anecdotes')
analyses_category = NoticeCategory.create(title: 'Analyses', nicename: 'analyses')

# SEED NOTICES CATEGORIES SECOND LEVEL
cinema_category = NoticeCategory.create(title: 'Au cinéma', nicename: 'impact_cinema', parent: impact_category)
music_category  = NoticeCategory.create(title: 'Dans la musique', nicename: 'impact_music', parent: impact_category)
games_category  = NoticeCategory.create(title: 'Dans les jeux vidéo', nicename: 'impact_games', parent: impact_category)

symbolic_category  = NoticeCategory.create(title: 'Allégorie de la mort', nicename: 'analyses_death', parent: analyses_category)
technical_category  = NoticeCategory.create(title: 'Analyse technique', nicename: 'analyses_technical', parent: analyses_category)
religious_category  = NoticeCategory.create(title: 'Références religieuses', nicename: 'analyses_religious', parent: analyses_category)

secrets_category  = NoticeCategory.create(title: 'Secrets de tournage', nicename: 'anecdotes_secrets', parent: anecdotes_category)

deshumanisation_category  = NoticeCategory.create(title: 'Déshumanisation', nicename: 'themes_deshumanisation', parent: themes_category)
others_category  = NoticeCategory.create(title: 'Autres', nicename: 'themes_others', parent: themes_category)

# SEED NOTICES

movie.notices.create(title: 'Bienvenue', timecode: '1', short_content: 'Ici s\'afficheront les notices documentaires de votre film. Bon visionnage !', content: '')

# IMPACT / CINEMA
movie.notices.create(title: 'Blade Runner', timecode: '1382', short_content: 'Le commissariat de Blade Runner est la copie conforme (angle de vue compris) d’une des tours de Metropolis.', content: '')
movie.notices.create(title: 'Star Wars', timecode: '2400', short_content: 'Le design de C-3PO dans Star Wars possède une troublante ressemblance avec l’androïde.', content: '')
movie.notices.create(title: 'Frankenstein', timecode: '4604', short_content: 'Le laboratoire de Frankenstein est inspiré de celui de Rotwang.', content: '')
movie.notices.create(title: 'Cinquième Element', timecode: '4704', short_content: 'Le laboratoire du Cinquième Element est inspiré de celui de Rotwang.', content: '')
movie.notices.create(title: 'Igor', timecode: '4804', short_content: 'Pour les décors d’Igor (2007), le réalisateur Anthony Leondis déclare avoir été influencé par l’expressionnisme allemand, notamment Metropolis de Fritz Lang, ainsi que par l’univers du Frankenstein de James Whale.', content: '')

# IMPACT / MUSIQUE
movie.notices.create(title: 'Express Yourself - Madonna', timecode: '240', short_content: 'Le vidéo-clip Express Yourself de Madonna réalisé par David Fincher en 1989 reprend l’intrigue du film ainsi que certains décors (la ville haute, la ville basse, la machine actionnée par les ouvriers...).', content: '')
movie.notices.create(title: 'The Wall - Pink Floyd', timecode: '2400', short_content: 'On reconnaîtra les ouvriers qui descendent vers les machines dans les écoliers à la chaîne de Pink Floyd The Wall.', content: '')
movie.notices.create(title: 'Radio Gaga - Queen', timecode: '4604', short_content: 'Le clip musical Radio Gaga de Queen reprend les scènes de Metropolis.', content: '')
movie.notices.create(title: 'Invincible - Muse', timecode: '1070', short_content: 'Le clip de la chanson Invincible du groupe Muse, sortie en 2006 sur l’album Black Holes and Revelations représente une ville très ressemblante à celle de Metropolis. Ce clip traite de la destruction du monde et le retour à l’âge de pierre, ce qui n’est pas sans rappeler un des thèmes du film.', content: '')
movie.notices.create(title: 'Alejandro - Lady Gaga', timecode: '5777', short_content: 'Lady Gaga reprend des thèmes de Metropolis dans Alejandro et Paparazzi. En fausse Maria, l’artiste se représente comme l’être démon qui exalte les foules', content: '')

# IMPACT / JEUX VIDEOS
movie.notices.create(title: 'BioShock', timecode: '6863', short_content: 'Les développeurs de BioShock, jeu vidéo plébiscité par la critique, se sont fortement inspirés de l’oeuvre de Lang pour créer leur ville sousmarine, Rapture.', content: '', category: games_category)
movie.notices.create(title: 'Final Fantasy 7', timecode: '364', short_content: 'Final Fantasy VII reprend également le thème de la ville basse et la ville haute, séparées par une immense plaque d’acier et de béton.', content: '', category: games_category)
movie.notices.create(title: 'Final Fantasy XII', timecode: '570', short_content: 'Final Fantasy XII également, en accentuant la perspective d’inégalité sociale. Archadès donne un contraste plus frappant.', content: '', category: games_category)
movie.notices.create(title: 'Ratchet et Clank', timecode: '600', short_content: 'Le jeu se déroule dans une ville également appelée Métropolis, qui possède de nombreuses similitudes avec la ville imaginé par Fridtz Land.', content: '', category: games_category)
