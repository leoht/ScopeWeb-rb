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

movie.related_movies  << RelatedMovie.create(title: 'Inglorious Basterds', image: 'poster-inglorious.jpg', year: '2011')
movie.related_movies  << RelatedMovie.create(title: 'Le Cinquième Element', image: 'poster-5e-element.jpg', year: '1997')
movie.related_movies  << RelatedMovie.create(title: 'Blade Runner', image: 'poster-blade.jpg', year: '1982')
movie.related_movies  << RelatedMovie.create(title: 'Edward aux mains d\'argent', image: 'poster-edward.jpg', year: '1990')

# Related facts

movie.related_facts <<  MovieRelatedFact.create(title: 'Curiosity débarque sur Mars', content: 'En août 2012, la NASA déploie la sonde Curiosity afin d’explorer le sol martien et d’ouvrir de nouveux horizons à la conquête spatiale.', photo: 'photo-curiosity.jpg')
movie.related_facts <<  MovieRelatedFact.create(title: 'La moto Superbike de Tron devient réalité', content: 'La marque anglaise Lotus s’est associée au graphiste Daniel Simon pour concevoir un modèle de moto très grandement inspiré du film Tron', photo: 'photo-tron.jpg')
movie.related_facts <<  MovieRelatedFact.create(title: 'Foxconn veut remplacer ses ouvriers par des robots', content: 'Le plus grand fabricant mondial de matériel informatique souhaite remplacer un million de ses employés en usine par des robots, afin d’améliorer sa productivité.', photo: 'photo-foxconn.jpg')
movie.related_facts <<  MovieRelatedFact.create(title: 'Google mise sur ses robots', content: 'Depuis quelques mois, le géant du web Google rachète de nombreuses entreprises spécialisées dans la robotique. La firme souhaite-t-elle se créer une “armée” de robots pour ses prochains projets ?', photo: 'photo-google.jpg')

# movie.chapters.create(number: 1, title: 'Enfer et Paradis', timecode: '60')
# movie.chapters.create(number: 2, title: 'La Révélation', timecode: '572')
# movie.chapters.create(number: 3, title: 'Moloch', timecode: '780')

# SEED NOTICES CATEGORIES FIRST LEVEL
impact_category = NoticeCategory.create(title: 'Impact sur la culture populaire', nicename: 'impact', color: 'FF7C00')
themes_category = NoticeCategory.create(title: 'Thèmes clés', nicename: 'themes', color: 'e4a100')
anecdotes_category = NoticeCategory.create(title: 'Anecdotes', nicename: 'anecdotes', color: '22FF9D')
analyses_category = NoticeCategory.create(title: 'Analyses', nicename: 'analyses', color: 'f0004e')

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

movie.notices.create(title: 'Bienvenue', timecode: '1', short_content: 'Ici s\'afficheront les notices documentaires de votre film. Vous pouvez défiler sur la ligne temporelle pour retrouver celles que vous avez déjà vues ou ratées. Rendez-vous à la fin du film, bon visionnage !', content: '', category: cinema_category)

# IMPACT / CINEMA
movie.notices.create(title: 'Blade Runner', timecode: '1382', short_content: 'Le commissariat de Blade Runner est la copie conforme (angle de vue compris) d’une des tours de Metropolis.', content: '', category: cinema_category)
movie.notices.create(title: 'Star Wars', timecode: '2400', short_content: 'Le design de C-3PO dans Star Wars possède une troublante ressemblance avec l’androïde.', content: '', category: cinema_category)
movie.notices.create(title: 'Frankenstein', timecode: '4604', short_content: 'Le laboratoire de Frankenstein est inspiré de celui de Rotwang.', content: '', category: cinema_category)
movie.notices.create(title: 'Cinquième Element', timecode: '4704', short_content: 'Le laboratoire du Cinquième Element est inspiré de celui de Rotwang.', content: '', category: cinema_category)
movie.notices.create(title: 'Igor', timecode: '4804', short_content: 'Pour les décors d’Igor (2007), le réalisateur Anthony Leondis déclare avoir été influencé par l’expressionnisme allemand, notamment Metropolis de Fritz Lang, ainsi que par l’univers du Frankenstein de James Whale.', content: '', category: cinema_category)

# IMPACT / MUSIQUE
movie.notices.create(title: 'Express Yourself - Madonna', timecode: '240', short_content: 'Le vidéo-clip Express Yourself de Madonna réalisé par David Fincher en 1989 reprend l’intrigue du film ainsi que certains décors (la ville haute, la ville basse, la machine actionnée par les ouvriers...).', content: '', category: music_category)
movie.notices.create(title: 'The Wall - Pink Floyd', timecode: '2400', short_content: 'On reconnaîtra les ouvriers qui descendent vers les machines dans les écoliers à la chaîne de Pink Floyd The Wall.', content: '', category: music_category)
movie.notices.create(title: 'Radio Gaga - Queen', timecode: '4604', short_content: 'Le clip musical Radio Gaga de Queen reprend les scènes de Metropolis.', content: '', category: music_category)
movie.notices.create(title: 'Invincible - Muse', timecode: '1070', short_content: 'Le clip de la chanson Invincible du groupe Muse, sortie en 2006 sur l’album Black Holes and Revelations représente une ville très ressemblante à celle de Metropolis. Ce clip traite de la destruction du monde et le retour à l’âge de pierre, ce qui n’est pas sans rappeler un des thèmes du film.', content: '', category: music_category)
movie.notices.create(title: 'Alejandro - Lady Gaga', timecode: '5777', short_content: 'Lady Gaga reprend des thèmes de Metropolis dans Alejandro et Paparazzi. En fausse Maria, l’artiste se représente comme l’être démon qui exalte les foules', content: '', category: music_category)

# IMPACT / JEUX VIDEOS
movie.notices.create(title: 'BioShock', timecode: '6863', short_content: 'Les développeurs de BioShock, jeu vidéo plébiscité par la critique, se sont fortement inspirés de l’oeuvre de Lang pour créer leur ville sousmarine, Rapture.', content: '', category: games_category)
movie.notices.create(title: 'Final Fantasy 7', timecode: '364', short_content: 'Final Fantasy VII reprend également le thème de la ville basse et la ville haute, séparées par une immense plaque d’acier et de béton.', content: '', category: games_category)
movie.notices.create(title: 'Final Fantasy XII', timecode: '570', short_content: 'Final Fantasy XII également, en accentuant la perspective d’inégalité sociale. Archadès donne un contraste plus frappant.', content: '', category: games_category)
movie.notices.create(title: 'Ratchet et Clank', timecode: '600', short_content: 'Le jeu se déroule dans une ville également appelée Métropolis, qui possède de nombreuses similitudes avec la ville imaginé par Fridtz Land.', content: '', category: games_category)

# THEMES / DESHUMANISATION
movie.notices.create(title: 'Mis au Pas', timecode: '260', short_content: 'Ces travailleurs apparaissent comme «mis au pas», privés de liberté et de libre arbitre, épuisés par un labeur exténuant.', content: 'Ces travailleurs apparaissent comme «mis au pas», privés de liberté et de libre arbitre, épuisés par un labeur exténuant. Leur démarche mécanique évoque le monde dans lequel ils vivent et auquel ils ressemblent : ce sont de véritables « hommes machines », de vrais robots.', category: deshumanisation_category)
movie.notices.create(title: 'Âme et singularité dévorées', timecode: '805', short_content: 'L’usine elle-même, telle Chronos dévorant ses enfants, se nourrit de chair humaine. Lorsqu’ils ne périssent pas physiquement, les ouvriers sont tout simplement anéantis dans leur âme et leur singularité.', content: 'L’usine elle-même, telle Chronos dévorant ses enfants, se nourrit de chair humaine. Lorsqu’ils ne périssent pas physiquement, les ouvriers sont tout simplement anéantis dans leur âme et leur singularité.', category: deshumanisation_category)

# ANALYSES / SYMBOLIQUE
movie.notices.create(title: 'Hel', timecode: '2220', short_content: 'Hel porte le nom de la divinité germanique des enfers. Hel est une morte absente mais qui pèse sur Jo Fredersen, son fils Freder et son ancien amant', content: '', category: symbolic_category)
movie.notices.create(title: 'Moloch', timecode: '888', short_content: 'La vision de Moloch (divinité démoniaque) dévorant les hommes.', content: '', category: symbolic_category)
movie.notices.create(title: 'Statue de la Mort', timecode: '5353', short_content: 'La statue de la mort dans l’église lors du rendez-vous manqué avec Maria, est une allégorie de la mort.', content: '', category: symbolic_category)
movie.notices.create(title: 'Rotwang', timecode: '3690', short_content: 'Rotwang est représenté comme une sorte de maître des enfers (la scène où il poursuit Maria dans les catacombes l’associe d’ailleurs clairement à Lucifer, littéralement le porteur de lumière.', content: '', category: symbolic_category)

# ANALYSES / TECHNIQUE
movie.notices.create(title: 'Lumières révélatrices', timecode: '579', short_content: 'Le contraste entre la fausse et la vraie Maria est mis en évidence par leur mise en lumière. La fausse Maria, née du contrôle du feu et de l’électricité, brille de mille éclats en réfléchissant la lumière sur toutes les formes de son corps. Ses formes sont accentués par cette lumière de source artificielle. Dans un esprit d’opposition, la vraie Maria fait sa première apparition auréolée d’un médaillon de lumière ouatée, tel une icône religieuse.', content: '', category: technical_category)
movie.notices.create(title: 'Le contrôle des lumières', timecode: '3705', short_content: 'Rotwang est associé avec la lumière artificielle dont il peut se servir avec un contrôle presque total. La scène dans les catacombes reflète le contrôle qu’il possède de la science de la lumière. De son bras artificiel, il éteint la frêle source lumineuse de Maria qui, plongée dans les ténèbres des catacombes, essaie vainement d’échapper à ce rayon de lumière.', content: '', category: technical_category)
movie.notices.create(title: 'Un sentiment d’immensité', timecode: '6856', short_content: 'Les champs très larges sont utilisés pour les vues de la ville. En optant pour ce type de champs, il donne au spectateur une impression d’immensité, de liberté et surtout d’espace sans limite. On le voit grâce à la luminosité des projecteurs de la ville, qui dirigent notre vision dans tous les sens.', content: '', category: technical_category)
movie.notices.create(title: 'L’effet Schufftan', timecode: '320', short_content: 'Lang réalise des miniatures de la ville, un appareil photo sur une balançoire et utilise plus particulièrement l’effet Schufftan. Pour ce dernier, il utilise des miroirs inclinés pour créer l’illusion que les acteurs occupent des décors géants. Cette invention sera utilisée deux ans plus tard par Alfred Hitchcock dans Chantage sorti en 19292.', content: '', category: technical_category)

movie.notices.create(title: 'Les rescapés', timecode: '401', short_content: 'On peut supposer que les hommes libres échappent à cette instrumentalisation et peuvent développer leur humanité et leur singularité.', content: 'On peut supposer que les hommes libres échappent à cette instrumentalisation et peuvent développer leur humanité et leur singularité.', category: deshumanisation_category)
movie.notices.create(title: 'Inversion Homme Machine', timecode: '1920', short_content: 'Ce que met en scène Fritz Lang, c’est l’inversion du rapport homme machine avec l’organisation scientifique du travail. Ce n’est plus l’homme qui porte et dirige la machine mais l’inverse. Dans Metropolis, les ouvriers sont tout bonnement crucifiés sur des horloges.', content: 'Ce que met en scène Fritz Lang, c’est l’inversion du rapport homme machine avec l’organisation scientifique du travail. Ce n’est plus l’homme qui porte et dirige la machine mais l’inverse. Dans Metropolis, les ouvriers sont tout bonnement crucifiés sur des horloges.', category: deshumanisation_category)

