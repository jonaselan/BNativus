# Choose the official Ruby 2.4.1 image as our starting point
FROM ruby:2.4.1

# Run updates
RUN apt-get update -yqq \
    && apt-get install -y build-essential libpq-dev nodejs
    
# Set up working directory
RUN mkdir /myapp
WORKDIR /myapp

# Set up gems
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Finally, add the rest of our app's code
# (this is done at the end so that changes to our app's code
# don't bust Docker's cache)
COPY . /myapp