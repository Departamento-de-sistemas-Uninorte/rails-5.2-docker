FROM ruby:2.5

EXPOSE 3000
WORKDIR /usr/src/app

RUN apt-get update -qq && apt-get install -y nodejs

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Copy gems files
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

# Intall gems
RUN bundle install

# Copy files from my local folder
COPY . .