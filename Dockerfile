FROM nginx:1-alpine

COPY build/dirhtml /usr/share/nginx/html
