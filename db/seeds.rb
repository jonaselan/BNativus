ll = Language.create(name: 'portugues', shortcode: 'pt-br')
Language.create(name: 'inglês', shortcode: 'en')

uu = User.create(email: 'email@email.com', username: 'user1', password: 123456)

Room.create(link: 'http://link.com', level: 'básico', language_id: ll, user_id: uu)
