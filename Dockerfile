# Use official Node.js image
FROM node:14

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to /app directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application into /app
COPY . .

# Expose the app on port 3000
EXPOSE 3000

# Command to start the app
CMD ["npm", "start"]
