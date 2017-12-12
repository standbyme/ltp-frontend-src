FROM nginx
COPY dist/index.html /usr/share/nginx/html/index.html
COPY dist/static /usr/share/nginx/html/static