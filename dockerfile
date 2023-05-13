# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Add the index.html file to the working directory
"COPY index.html ."

# Build the application
RUN npm run build

# Expose port 80 for the application
EXPOSE 80

# Start the application using the production server
CMD [ "npm", "start" ]


