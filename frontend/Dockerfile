FROM node:20-alpine

WORKDIR /app

# 1. Create the .npm directory and ensure the user can write to it
# We also set the npm global prefix to a directory the user owns
RUN mkdir -p /.npm && chmod 777 /.npm
ENV NPM_CONFIG_PREFIX=/app/.npm-global
ENV PATH=$PATH:/app/.npm-global/bin

# 2. Fix permissions for the workdir
# In Alpine, it's safer to ensure the directory exists before chowning
RUN chown -R 1000:1000 /app

# 3. Switch to the non-root user BEFORE running npm install
# This ensures package-lock.json and node_modules are owned by 1000
USER 1000

# Install Angular CLI globally (into the local app folder we now own)
RUN npm install -g @angular/cli

# Copy package files and install dependencies
COPY --chown=1000:1000 package*.json ./
RUN npm ci

# Copy the rest of the app
COPY --chown=1000:1000 . .

EXPOSE 4200

CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4200", "--poll", "2000", "--disable-host-check", "--no-open"]