lang_en = Language.create(name: 'language_en', shortcode: 'en')
lang_pt = Language.create(name: 'language_ptbr', shortcode: 'pt-br')
Language.create(name: 'language_es', shortcode: 'es')

uu = User.create(email: 'email@email.com', username: 'user1', password: 123456)
uu2 = User.create(email: 'email2@email.com', username: 'user2', password: 123456)

UserKnownLanguage.create(user: uu, known_languages: lang_pt, write: 3, speak: 5)
UserKnownLanguage.create(user: uu2, known_languages: lang_en, write: 3, speak: 5)

UserLanguagesStudied.create(user: uu, languages_studied: lang_en, write: 5, speak: 4)
UserLanguagesStudied.create(user: uu2, languages_studied: lang_pt, write: 4, speak: 4)

Room.create(link: 'http://link.com', level: 'begginer', language: lang_pt, user: uu)
Room.create(link: 'http://link.com', level: 'upper_begginer', language: lang_en, user: uu2)

c1 = Category.create(title: 'music')
c2 = Category.create(title: 'travel')
Category.create(title: 'news')
Category.create(title: 'tv_radio')
Category.create(title: 'film')
Category.create(title: 'book')
Category.create(title: 'podcast')
Category.create(title: 'humor')
Category.create(title: 'documentaries')
Category.create(title: 'posts')
Category.create(title: 'animation')
Category.create(title: 'quotes')
Category.create(title: 'stories')
Category.create(title: 'others')

Article.create(title: 'title', content: 'content', views: 2, language: lang_pt, user: uu2, category: c1)
Debate.create(title: 'title2', content: 'content2', views: 1, language: lang_en, user: uu, category: c2)
