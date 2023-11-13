# Base image
FROM node:18-alpine

# Install pnpm
RUN npm install -g pnpm

# Set the working directory
WORKDIR /app

# Copy package.json and pnpm-lock.yaml files to the container
COPY package.json .

# Limpar o cache do npm (antes de copiar todos os arquivos)
RUN npm cache clean --force

# Install dependencies using pnpm
RUN pnpm install -f

# Copy the application code to the container
COPY . .

# Expose the port that the application will be running on
EXPOSE 8080

# Start the application
CMD [ "pnpm", "run", "start:dev" ]
