FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <- all the static content to be served

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html