# BNativus

[![Build Status](https://travis-ci.org/jonaselan/BNativus.svg?branch=master)](https://travis-ci.org/jonaselan/BNativus)

System for those who are learning a new language and seek for people for practice your speaking and writing

## Requirements

* [Ruby](https://www.ruby-lang.org) (2.4.1 used)
* [Rails](http://rubyonrails.org/)  (5.1.4 used)
* [Postgresql](https://www.postgresql.org/)

## Install

```
bundle install
rails db:create
rails db:migration
rails db:seed
```

## Configuration

For authentication with Google, it's necessary create a new app and setup him for works fine with gem **omniauth-google-oauth2**. After the do that, put your `Client ID` and `Secret key` in environment variables, this way `export GOOGLE_CLIENT_ID=your_client_id_here` and `export GOOGLE_CLIENT_SECRET=your_client_secret_here`. For more information, read this [doc](https://github.com/zquestz/omniauth-google-oauth2) or this [tutorial](https://www.interexchange.org/articles/engineering/lets-devise-google-oauth-login/#setting-everything-up)

## Contributions

1. Fork the project
2. Create a branch with your changes (`git checkout -b my-new-feature`)
3. Commit this changes (`git commit -am 'Add some feature'`)
4. Make the push (`git push origin my-new-feature`)
5. Create the Pull Request

**[bug reports](https://github.com/jonaselan/bnativus/issues) are welcome here!**
<!-- **Tested code only Apenas código testado será aceito** -->

## Copyright

Copyright © Jonas Elan 2017. All right reserved.
