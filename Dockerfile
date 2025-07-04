# Use Node.js 18 Alpine image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install ALL dependencies (including devDependencies for build)
RUN npm ci

# Copy application code
COPY . .

# Build the application using production server
RUN npx vite build && npx esbuild server/production.ts --platform=node --packages=external --bundle --format=esm --outfile=dist/index.js

# Remove devDependencies after build to reduce image size
RUN npm prune --production

# Expose port (use environment variable or default)
EXPOSE ${PORT:-5000}

# Set environment to production
ENV NODE_ENV=production

# Start the application
CMD ["npm", "start"]