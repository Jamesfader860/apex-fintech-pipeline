# 1. Use a minimal, secure base image
FROM node:20-alpine

# 2. Set working directory inside the container
WORKDIR /usr/src/app

# 3. Copy dependency definitions first (Optimizes layer caching)
COPY package.json ./

# 4. Install production dependencies
RUN npm install --only=production

# 5. Copy the rest of the application code
COPY server.js ./

# 6. SECURITY: Switch to non-root user
USER node

# 7. Expose application port
EXPOSE 3000

# 8. Start the application
CMD ["npm", "start"]