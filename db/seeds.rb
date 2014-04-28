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

movie.comments.create(timecode: '50', content: 'Ce film est vraiment incroyable, merci Scope !', user_id: 1)

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
impact_category = NoticeCategory.create(title: 'Impact sur la culture populaire', nicename: 'impact', color: 'f1c89e')
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

scope_category = NoticeCategory.create(title: 'Scope', nicename: 'scope', color: 'fff')
# SEED NOTICES

movie.notices.create(title: 'Bienvenue', timecode: '10', short_content: 'Ici s\'afficheront les notices documentaires de votre film. ', content: '', category: scope_category)

# IMPACT / CINEMA
movie.notices.create(title: 'Blade Runner', timecode: '1382', end_timecode: '1403', short_content: 'Le commissariat de Blade Runner est la copie conforme (angle de vue compris) d’une des tours de Metropolis.', content: '', category: cinema_category)
movie.notices.create(title: 'Star Wars', timecode: '2400', end_timecode: '2475', short_content: 'Le design de C-3PO dans Star Wars possède une troublante ressemblance avec l’androïde.', content: '', category: cinema_category)
movie.notices.create(title: 'Frankenstein', timecode: '4604', end_timecode: '4680', short_content: 'Le laboratoire de Frankenstein est inspiré de celui de Rotwang.', content: '', category: cinema_category)
movie.notices.create(title: 'Cinquième Element', timecode: '4704', end_timecode: '4764', short_content: 'Le laboratoire du Cinquième Element est inspiré de celui de Rotwang.', content: '', category: cinema_category)
movie.notices.create(title: 'Igor', timecode: '4804', end_timecode: '4880', short_content: 'Pour les décors d’Igor (2007), le réalisateur Anthony Leondis déclare avoir été influencé par l’expressionnisme allemand, notamment Metropolis de Fritz Lang, ainsi que par l’univers du Frankenstein de James Whale.', content: '', category: cinema_category)

# IMPACT / MUSIQUE
movie.notices.create(title: 'Express Yourself - Madonna', timecode: '240', short_content: 'Le vidéo-clip Express Yourself de Madonna réalisé par David Fincher en 1989 reprend l’intrigue du film ainsi que certains décors (la ville haute, la ville basse, la machine actionnée par les ouvriers...).', content: '', category: music_category)
movie.notices.create(title: 'The Wall - Pink Floyd', timecode: '2400', end_timecode: '2500', short_content: 'On reconnaîtra les ouvriers qui descendent vers les machines dans les écoliers à la chaîne de Pink Floyd The Wall.', content: '', category: music_category)
movie.notices.create(title: 'Radio Gaga - Queen', timecode: '4604', short_content: 'Le clip musical Radio Gaga de Queen reprend les scènes de Metropolis.', content: '', category: music_category)
movie.notices.create(title: 'Invincible - Muse', timecode: '1070', end_timecode: '1190', short_content: 'Le clip de la chanson Invincible du groupe Muse, sortie en 2006 sur l’album Black Holes and Revelations représente une ville très ressemblante à celle de Metropolis. Ce clip traite de la destruction du monde et le retour à l’âge de pierre, ce qui n’est pas sans rappeler un des thèmes du film.', content: '', category: music_category)
movie.notices.create(title: 'Alejandro - Lady Gaga', timecode: '5777', end_timecode: '5782', short_content: 'Lady Gaga reprend des thèmes de Metropolis dans Alejandro et Paparazzi. En fausse Maria, l’artiste se représente comme l’être démon qui exalte les foules', content: '', category: music_category)

# IMPACT / JEUX VIDEOS
movie.notices.create(title: 'BioShock', timecode: '6863', end_timecode: '6950', short_content: 'Les développeurs de BioShock, jeu vidéo plébiscité par la critique, se sont fortement inspirés de l’oeuvre de Lang pour créer leur ville sousmarine, Rapture.', content: '', category: games_category)
movie.notices.create(title: 'Final Fantasy 7', timecode: '364', end_timecode: '424', short_content: 'Final Fantasy VII reprend également le thème de la ville basse et la ville haute, séparées par une immense plaque d’acier et de béton.', content: '', category: games_category)
movie.notices.create(title: 'Final Fantasy XII', timecode: '570', end_timecode: '700', short_content: 'Final Fantasy XII également, en accentuant la perspective d’inégalité sociale. Archadès donne un contraste plus frappant.', content: '', category: games_category)
movie.notices.create(title: 'Ratchet et Clank', timecode: '600', end_timecode: '630', short_content: 'Le jeu se déroule dans une ville également appelée Métropolis, qui possède de nombreuses similitudes avec la ville imaginé par Fridtz Land.', content: '', category: games_category)

# THEMES / DESHUMANISATION
movie.notices.create(title: 'Mis au Pas', timecode: '260', short_content: 'Ces travailleurs apparaissent comme «mis au pas», privés de liberté et de libre arbitre, épuisés par un labeur exténuant.', content: 'Ces travailleurs apparaissent comme «mis au pas», privés de liberté et de libre arbitre, épuisés par un labeur exténuant. Leur démarche mécanique évoque le monde dans lequel ils vivent et auquel ils ressemblent : ce sont de véritables « hommes machines », de vrais robots.', category: deshumanisation_category)
movie.notices.create(title: 'Âme et singularité dévorées', timecode: '805', short_content: 'L’usine elle-même, telle Chronos dévorant ses enfants, se nourrit de chair humaine. Lorsqu’ils ne périssent pas physiquement, les ouvriers sont tout simplement anéantis dans leur âme et leur singularité.', content: 'L’usine elle-même, telle Chronos dévorant ses enfants, se nourrit de chair humaine. Lorsqu’ils ne périssent pas physiquement, les ouvriers sont tout simplement anéantis dans leur âme et leur singularité.', category: deshumanisation_category)

# ANALYSES / SYMBOLIQUE
movie.notices.create(title: 'Hel', timecode: '2220', end_timecode: '2350', short_content: 'Hel porte le nom de la divinité germanique des enfers. Hel est une morte absente mais qui pèse sur Jo Fredersen, son fils Freder et son ancien amant', content: '', category: symbolic_category)
movie.notices.create(title: 'Moloch', timecode: '888', end_timecode: '960', short_content: 'La vision de Moloch (divinité démoniaque) dévorant les hommes.', content: '', category: symbolic_category)
movie.notices.create(title: 'Statue de la Mort', timecode: '5353', end_timecode: '5433', short_content: 'La statue de la mort dans l’église lors du rendez-vous manqué avec Maria, est une allégorie de la mort.', content: '', category: symbolic_category)
movie.notices.create(title: 'Rotwang', timecode: '3690', end_timecode: '3800', short_content: 'Rotwang est représenté comme une sorte de maître des enfers (la scène où il poursuit Maria dans les catacombes l’associe d’ailleurs clairement à Lucifer, littéralement le porteur de lumière.', content: '', category: symbolic_category)

# ANALYSES / TECHNIQUE
movie.notices.create(title: 'Lumières révélatrices', timecode: '579', short_content: 'Le contraste entre la fausse et la vraie Maria est mis en évidence par leur mise en lumière. La fausse Maria, née du contrôle du feu et de l’électricité, brille de mille éclats en réfléchissant la lumière sur toutes les formes de son corps. Ses formes sont accentués par cette lumière de source artificielle. Dans un esprit d’opposition, la vraie Maria fait sa première apparition auréolée d’un médaillon de lumière ouatée, tel une icône religieuse.', content: '', category: technical_category)
movie.notices.create(title: 'Le contrôle des lumières', timecode: '3705', short_content: 'Rotwang est associé avec la lumière artificielle dont il peut se servir avec un contrôle presque total. La scène dans les catacombes reflète le contrôle qu’il possède de la science de la lumière. De son bras artificiel, il éteint la frêle source lumineuse de Maria qui, plongée dans les ténèbres des catacombes, essaie vainement d’échapper à ce rayon de lumière.', content: '', category: technical_category)
movie.notices.create(title: 'Un sentiment d’immensité	', timecode: '6856', short_content: 'Les champs très larges sont utilisés pour les vues de la ville. En optant pour ce type de champs, il donne au spectateur une impression d’immensité, de liberté et surtout d’espace sans limite. On le voit grâce à la luminosité des projecteurs de la ville, qui dirigent notre vision dans tous les sens.', content: '', category: technical_category)
movie.notices.create(title: 'L’effet Schufftan', timecode: '320', short_content: 'Lang réalise des miniatures de la ville, un appareil photo sur une balançoire et utilise plus particulièrement l’effet Schufftan. Pour ce dernier, il utilise des miroirs inclinés pour créer l’illusion que les acteurs occupent des décors géants. Cette invention sera utilisée deux ans plus tard par Alfred Hitchcock dans Chantage sorti en 1929.', content: '', category: technical_category)

movie.notices.create(title: 'Les rescapés', timecode: '401', short_content: 'On peut supposer que les hommes libres échappent à cette instrumentalisation et peuvent développer leur humanité et leur singularité.', content: 'On peut supposer que les hommes libres échappent à cette instrumentalisation et peuvent développer leur humanité et leur singularité.', category: deshumanisation_category)
movie.notices.create(title: 'Inversion Homme Machine', timecode: '1920', short_content: 'Ce que met en scène Fritz Lang, c’est l’inversion du rapport homme machine avec l’organisation scientifique du travail. Ce n’est plus l’homme qui porte et dirige la machine mais l’inverse. Dans Metropolis, les ouvriers sont tout bonnement crucifiés sur des horloges.', content: 'Ce que met en scène Fritz Lang, c’est l’inversion du rapport homme machine avec l’organisation scientifique du travail. Ce n’est plus l’homme qui porte et dirige la machine mais l’inverse. Dans Metropolis, les ouvriers sont tout bonnement crucifiés sur des horloges.', category: deshumanisation_category)
movie.notices.create(title: 'Corps et machine', timecode: '2417', short_content: 'La rencontre du corps et de la machine est traitée dans le film à travers les figures de l’androïde ou du Moloch, personnification monstrueuse de l’usine. Ce n’est plus ici l’homme qui ressemble à une machine, mais la machine qui ressemble à l’homme.', content: 'Ce que met en scène Fritz Lang, c’est l’inversion du rapport homme machine avec l’organisation scientifique du travail. Ce n’est plus l’homme qui porte et dirige la machine mais l’inverse. Dans Metropolis, les ouvriers sont tout bonnement crucifiés sur des horloges.', category: deshumanisation_category)
movie.notices.create(title: 'Une masse automate', timecode: '3034', short_content: 'Ils forment une masse d’automates aux pieds de plomb sans plus aucune humanité. Cette condition ouvrière moderne, sinon futuriste, est mise en relation par Maria dans les catacombes avec le mythe de la tour de Babel.', category: deshumanisation_category)
movie.notices.create(title: 'Monstre effrayant', timecode: '7828', short_content: 'Ce qui effraie chez ces monstres, c’est leur relation de ressemblance et de dissemblance avec nous. Ils nous ressemblent parce qu’ils possèdent une motivation, une logique, un appétit et du désir, mais se distinguent de nous par un autre système de valeurs, de passions, d’ambitions, souvent exempt de pitié et d’empathie.', category: deshumanisation_category)
#30

# ANECDOTES / SECRETS DE TOURNAGE
movie.notices.create(title: 'De l\'eau glacée', timecode: '6686', short_content: 'Pour la scène où la ville des travailleurs est inondée, Helm et cinq cents enfants provenant des quartiers les plus pauvres de Berlin ont dû travailler durant quatorze jours dans une piscine d’eau que Lang a intentionnellement maintenue à une température basse.', category: secrets_category)
movie.notices.create(title: 'Tourné et retourné', timecode: '2965', short_content: 'Lang exige souvent de retourner la même scène à de multiples reprises. Par exemple, le tournage de la scène où Freder doit s’effondrer aux pieds de Maria a pris trois jours. Lang a exigé de la tourner tellement de fois qu’à la fin, Gustav Fröhlich tenait à peine debout.', category: secrets_category)
movie.notices.create(title: 'Des jets violents', timecode: '6955', short_content: 'Lang ordonne à ses assistants de jeter de puissants jets d’eau lors du tournage de l’inondation de la ville des travailleurs.', category: secrets_category)
movie.notices.create(title: 'Le robot de Rotwang', timecode: '4784', short_content: 'Maschinenmensch, le robot construit par Rotwang pour ressusciter l’amour perdu de Joh, a été créé par le sculpteur Walter Schulze-Mittendorff. Un moulage en plâtre a été pris sur le corps de l’actrice Brigitte Helm et le costume a ensuite été fabriqué à partir du moulage.', content: 'Maschinenmensch, le robot construit par Rotwang pour ressusciter l’amour perdu de Joh, a été créé par le sculpteur Walter Schulze-Mittendorff. Un moulage en plâtre a été pris sur le corps de l’actrice Brigitte Helm et le costume a ensuite été fabriqué à partir du moulage. Une découverte fortuite d’un matériel appelé «bois plastique» (une substance malléable ayant l’aspect du bois qui sert de remplissage) a permis à Schulze-Mittendorff de construire un costume en métal avec les articulations en «bois plastique». Malgré cette innovation, Helm se plaint d’être mal à l’aise, car le costume est trop rigide et lui donne des ecchymoses.', category: secrets_category)
movie.notices.create(title: 'Les gratte-ciel', timecode: '1070', short_content: 'Fritz Lang explique : « Le film est né de ma première vue avec les Gratte- Ciels de New-York en octobre 1924 ». Il décrit ainsi sa première impression de la ville, Lang dit que : « Les immeubles semblaient être comme un voile vertical, scintillant et très léger, comme un décor luxueux, suspendu dans un ciel sombre pour éblouir, distraire et hypnotiser ».', category: secrets_category)
movie.notices.create(title: 'Des jours pour des secondes', timecode: '1100', short_content: 'Les vues futuristes de la ville ont été créées image par image à l’aide de maquettes et d’effets spéciaux de peinture impliquant un travail sans fin de plusieurs semaines parfois.', category: secrets_category)
movie.notices.create(title: '1000 figurants au crâne rasé', timecode: '3034', short_content: 'Mille figurants ont eu le crâne rasé et ont tiré une maquette en parpaing à travers le Volkspark Rehberge de Berlin. La tour elle-même a été construite en modèle réduit.', category: secrets_category)
movie.notices.create(title: 'La cathédrale', timecode: '3034', short_content: 'Les détails de la cathédrale ont été construits à l’échelle sur une toile de fond. Les masques grandeur nature des personnages de la mort et des sept péchés capitaux ont été créés par le sculpteur Walter Schulze- Mittendorff à partir du même matériau que celui utilisé pour le robot.', category: secrets_category)
#38

movie.notices.create(title: 'Joh Fredersen', timecode: '1123', end_timecode: '1150', short_content: 'Joh Fredersen (Alfred Abel), père du jeune Freder. Le prénom Joh renvoie à Jéhovah, le Dieu biblique.', category: religious_category)
movie.notices.create(title: 'Babel, symbole d’incompréhension', timecode: '3034', end_timecode: '3150', short_content: 'La tour de Babel est une tour mythique évoquée dans la Genèse. Après le Déluge, les premiers hommes entreprennent sa construction pour atteindre le ciel, mais Dieu interrompt leur projet qu’il juge trop ambitieux, en brouillant leur langage afin qu’ils ne puissent plus se comprendre, et ainsi qu’ils ne puissent plus la contruire.', category: religious_category)
movie.notices.create(title: 'L\'enfer', timecode: '6180', end_timecode: '6200', short_content: 'Ces esclaves «vivent» ou plutôt dorment sous terre, ce qui évoque naturellement l’Enfer. Manipulé par le démon, ils cherchent à remonter à la surface dans une logique de destruction.', category: religious_category)
#41

# THEMES / AUTRES
movie.notices.create(title: 'Thème du double', timecode: '5220', end_timecode: '5280', short_content: 'Le thème du double revient très souvent. Cette récur	e est révélatrice d’une crise d’identité, d’une division du sujet entre le bien et le mal.', content: 'Le thème du double revient très souvent. Cette récurrence est révélatrice d’une crise d’identité, d’une division du sujet entre le bien et le mal. Dans Metropolis, Maria prêche une morale chrétienne, tandis que la fausse Maria est porteuse de la morale de la ville, dionysiaque et destructrice.', category: others_category)
movie.notices.create(title: 'La Ville expressionisme', timecode: '1070', end_timecode: '1140', short_content: 'La ville est un personnage à part entière du film. Elle traduit le sentiment de malaise face au développement industriel.', content: 'La ville est un personnage à part entière du film. Elle traduit le sentiment de malaise face au développement industriel. Paysage d’angoisse, espace propice aux contrastes de lumières reflétant les multiples facettes de l’âme humaine, la ville expressionniste se fait labyrinthique avec ses nombreux recoins et ruelles. Dans Metropolis elle est davantage tentaculaire, dévorante et monstrueuse : la représentation futuriste et monumentale de la cité tendrait plutôt à s’éloigner de l’expressionnisme, esthétiquement parlant. Aussi peut-on voir en Metropolis davantage un hommage à un mouvement qui aura marqué le cinéma au début de la décennie, et qui s’éteint à l’époque du tournage du film.', category: others_category)
movie.notices.create(title: 'Science-Fiction : un genre naissant', timecode: '1380', end_timecode: '1403', short_content: 'Metropolis présente le premier androïde féminin de l’histoire du cinéma. Le robot est un personnage qui deviendra récurrent dans le cinéma de science-fiction.', content: 'Dans les années 1920, trois films exploitent le filon d’un genre nouveau qui ne porte pas encore le nom de science- fiction (le terme est inventé en 1926 par Hugo Gernsback) : Aelita (Yakov Protazanov, 1924), Metropolis (1927) et La Femme sur la lune (1928) de Fritz Lang. Metropolis présente le premier androïde féminin de l’histoire du cinéma. Le robot est un personnage qui deviendra récurrent dans le cinéma de science-fiction.', category: others_category)

