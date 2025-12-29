# Use the full Ruby 3.4 image (Standard for Rails 8.1)
FROM ruby:3.4.1-bookworm

# 1. Essential system dependencies
# We keep these to ensure mysql and nodejs are ready
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libmariadb-dev \
    libmariadb-dev-compat \
    pkg-config \
    git \
    nodejs \
  && rm -rf /var/lib/apt/lists/*

# 2. Setup environment
WORKDIR /app
ENV BUNDLE_PATH=/app/vendor/bundle \
    BUNDLE_BIN=/app/vendor/bundle/bin

# 3. Update Bundler and System Gems
RUN gem update --system && gem install bundler

# 4. Handle Gemfile (Cleanup before build)
COPY Gemfile Gemfile.lock ./

# IMPORTANT: This fixes architecture mismatches if you are on a Mac
RUN bundle lock --add-platform x86_64-linux aarch64-linux

# 5. Install gems
RUN bundle install --jobs 20 --retry 5

# 6. Copy the rest of the application
COPY . .

EXPOSE 3000

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -p 3000"]