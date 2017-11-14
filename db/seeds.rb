lang_en = Language.create(name: 'language_en', shortcode: 'en')
lang_pt = Language.create(name: 'language_ptbr', shortcode: 'pt-br')
Language.create(name: 'language_es', shortcode: 'es')

uu = User.create(email: 'email@email.com', username: 'user1', password: 123456)
uu2 = User.create(email: 'email2@email.com', username: 'user2', password: 123456)

UserKnownLanguage.create(user: uu, known_languages: lang_pt, write: 3, speak: 5)
UserKnownLanguage.create(user: uu2, known_languages: lang_en, write: 3, speak: 5)

UserLanguageStudied.create(user: uu, languages_studied: lang_en, write: 5, speak: 4)
UserLanguageStudied.create(user: uu2, languages_studied: lang_pt, write: 4, speak: 4)

Room.create(link: 'http://link.com', level: 'begginer', language: lang_pt, user: uu)
Room.create(link: 'http://link.com', level: 'upper_begginer', language: lang_en, user: uu2)

c1 = Categoty.create(title: 'music')
c2 = Categoty.create(title: 'travel')
Categoty.create(title: 'news')
Categoty.create(title: 'tv_radio')
Categoty.create(title: 'film')
Categoty.create(title: 'book')
Categoty.create(title: 'podcast')
Categoty.create(title: 'humor')
Categoty.create(title: 'documentaries')
Categoty.create(title: 'articles')
Categoty.create(title: 'animation')
Categoty.create(title: 'quotes')
Categoty.create(title: 'stories')
Categoty.create(title: 'others')

Article.create(title: 'string', content: 'string', views: 2, language: lang_pt, user: uu2, category: c1)
Debate.create(title: 'string2', content: 'string2', views: 1, language: lang_en, user: uu, category: c2)
