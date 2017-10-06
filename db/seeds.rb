ll = Language.create(name: 'language_ptbr', shortcode: 'pt-br')
Language.create(name: 'language_en', shortcode: 'en')

uu = User.create(email: 'email@email.com', username: 'user1', password: 123456)

Room.create(link: 'http://link.com', level: 'begginer', language_id: ll, user_id: uu)
