# Use the official Node.js 14 Alpine image as the base image
FROM node:19-alpine

# Set the working directory in the container to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json. /

# Install dependencies
RUN npm install

# Copy the rest of the application to the container
COPY . .

# Install Prisma globally
RUN npm install -g prisma

# Generate the Prisma client
RUN prisma generate

# Copy the Prisma schema and database URL to the container
COPY prisma/schema.prisma. /prisma/

# Expose port 3000 on the container
EXPOSE 3000

# Start the server
CMD ["npm", "start"]