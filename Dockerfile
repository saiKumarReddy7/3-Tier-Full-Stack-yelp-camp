# Use Node 18 as parent image
#FROM node:18

# Change the working directory on the Docker image to /app
#WORKDIR /app

# Copy package.json and package-lock.json to the /app directory
#COPY package.json package-lock.json ./

# Install dependencies
#RUN npm install

# Copy the rest of project files into this image
#COPY . .

# Expose application port
#EXPOSE 3000

# Start the application
#CMD npm start

FROM node:14-alpine as build
WORKDIR /app        
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:14-alpine
WORKDIR /app
COPY --from=build /app ./
EXPOSE 3000
CMD ["npm", "start"]
