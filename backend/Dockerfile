# Use the full Ruby 3.4 image
FROM ruby:3.4.1-bookworm

# 1. Essential system dependencies
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

# IMPORTANT: Create the bundle directory and set permissions before switching users
RUN mkdir -p /app/vendor/bundle && chown -R 1000:1000 /app

ENV BUNDLE_PATH=/app/vendor/bundle \
    BUNDLE_BIN=/app/vendor/bundle/bin
ENV PATH="${BUNDLE_BIN}:${PATH}"

# 3. Update Bundler and System Gems
RUN gem update --system && gem install bundler

# --- SWITCH TO NON-ROOT USER ---
USER 1000

# 4. Handle Gemfile (Using --chown is critical here)
COPY --chown=1000:1000 Gemfile Gemfile.lock ./

# Fix architecture mismatches
RUN bundle lock --add-platform x86_64-linux aarch64-linux

# 5. Install gems (now running as user 1000)
RUN bundle install --jobs 20 --retry 5

# 6. Copy the rest of the application (ensuring ownership)
COPY --chown=1000:1000 . .

EXPOSE 3000

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -p 3000"]