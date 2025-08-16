FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./

# Fancy stuff for production
RUN npm ci --only=production && npm cache clean --force

FROM node:20-alpine AS runtime

WORKDIR /app

# Add user whose name is "app" who isnt root
RUN addgroup -S app && adduser -S app -G app

# Copies node_modules and by using chown it ensures the "app" user owns the files
COPY --from=builder --chown=app:app /app/node_modules ./node_modules

# Same thing
COPY --chown=app:app . .

# Switch to the non-root user
USER app

EXPOSE 3000

# Healthcheck to ensure the app is running for nodejs, we can use curl but node:20-alpine doesn't have it installed
HEALTHCHECK CMD node -e "require('http').get('http://localhost:3000', res => { process.exit(res.statusCode === 200 ? 0 : 1) })"

CMD ["node", "index.js"]