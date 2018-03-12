# BNativus

[![Build Status](https://travis-ci.org/jonaselan/BNativus.svg?branch=master)](https://travis-ci.org/jonaselan/BNativus)
[![Coverage Status](https://coveralls.io/repos/github/jonaselan/BNativus/badge.svg)](https://coveralls.io/github/jonaselan/BNativus)

System for those who are learning a new language and seek for people for practice your speaking and writing

## Requirements

* [Ruby](https://www.ruby-lang.org) (2.4.1 used)
* [Rails](http://rubyonrails.org/)  (5.1.4 used)
* [Postgresql](https://www.postgresql.org/) (10.3 used)
* [Docker](https://docs.docker.com/install/) and [Docker-compose](https://docs.docker.com/compose/install/) (optional)

## Install

### Configuration

You can configure the application normally installing the requirements on your machine and run:

```bash
bundle install
rails db:create
rails db:migration
rails db:seed
```

However, the application was configured to utilize **Docker**. This way, setting up the dev environment (test and prod too) is more easier.

#### Using docker

This commands should be run inside the project directory 

```bash
# build containers
docker-compose build

# create database
docker-compose run web rails db:create

# run migration 
docker-compose run web rails db:migrate

# if you want, fill the database with default values
docker-compose run web rails db:seed

# run container
docker-compose up web db

# if necessary, you can enter in containers using
docker-compose exec web bash

# any modification the requires run server again
docker-compose restart
```

Access `localhost:3000` or `0.0.0.0:3000`

### Environments variables

#### Google
For authentication with Google, it's necessary create a new app and setup him for works fine with gem **omniauth-google-oauth2**. After the do that, put your `Client ID` and `Secret key` in environment variables, like `export GOOGLE_CLIENT_ID=your_client_id_here` and `export GOOGLE_CLIENT_SECRET=your_client_secret_here`. For more information, read this [doc](https://github.com/zquestz/omniauth-google-oauth2) or this [tutorial](https://www.interexchange.org/articles/engineering/lets-devise-google-oauth-login/#setting-everything-up)

#### Cloudinary
For access medias correctly, add your credentials. For instance:

```bash
export CLOUD_NAME_CLOUDINARY=dzamfvsv4
export API_KEY_CLOUDINARY=779513321741769
export API_SECRET_CLOUDINARY=veGdSOV4GC09cyecAI4pj5Dd94
```

#### Using Docker

If you are using docker, just put all these information in `.env`. Exist a example how this file should be filled. 

```bash
cp .env.example .env
```

## Contributions

1. Fork the project
2. Create a branch with your changes (`git checkout -b my-new-feature`)
3. Commit this changes (`git commit -am 'Add some feature'`)
4. Make the push (`git push origin my-new-feature`)
5. Create the Pull Request

**[Bug reports](https://github.com/jonaselan/bnativus/issues) are welcome here!**
<!-- **Tested code only Apenas código testado será aceito** -->

## Copyright

Copyright © Jonas Elan 2017. All right reserved.
