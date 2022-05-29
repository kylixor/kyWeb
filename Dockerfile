FROM node:alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 8080

CMD ["npm", "run", "serve"]
LABEL org.opencontainers.image.description "https://github.com/kylixor/kyWeb-dev"