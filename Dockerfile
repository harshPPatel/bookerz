FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /bookerz
WORKDIR /bookerz

ENV RAILS_ENV='production'
ENV SECRET_KEY_BASE='8fa1d61fe73978e9ecae61e6844fc23bbcc069c69df083480c8094fd8e6463b4b43e62428bfc891d5f9232492535214681b38b51089483086bf0826e0610db99'

COPY Gemfile /bookerz/Gemfile
COPY Gemfile.lock /bookerz/Gemfile.lock
RUN bundle install
COPY . /bookerz

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]