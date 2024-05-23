FROM registry.access.redhat.com/ubi8/nodejs-18

WORKDIR /usr/src/app

# Copy in package.json and package-lock.json
COPY --chown=1001:1001 package*.json ./

# Install dependencies and devDependencies
RUN npm install

# Copy in source code and other assets
COPY --chown=1001:1001 . .

# Compile the source TS into JS files
# RUN npm run build:ts

# Configure fastify behaviour, and NODE_ENV
ENV NODE_ENV=production
ENV FASTIFY_PORT 8080
ENV FASTIFY_ADDRESS 0.0.0.0

EXPOSE 8080

# Launch the container by passing these parameters to the entrypoint
# These parameters can be overridden if you’d like
CMD [ "nodemon", "app.js" ]