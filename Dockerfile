
# build phase - install and cooy over dependencies and build
FROM node:18-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase - copy over /app/build/ to get build files and start nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
