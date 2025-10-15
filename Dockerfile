# Use an official Node.js image as base
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files into the container
COPY . .

# Build the React app for production
RUN npm run build

# Expose port (React dev server or static app later)
EXPOSE 3000

# Start the app (dev mode)
CMD ["npm", "start"]
