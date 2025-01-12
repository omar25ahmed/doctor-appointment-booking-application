FROM ruby:3.0.6

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client

# Set working directory
WORKDIR /app

# Copy the entire application
COPY . .

# Install dependencies
RUN bundle install

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
