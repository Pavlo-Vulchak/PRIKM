FROM nginx:latest
RUN rm -rf /usr/share/nginx/html/index.html
COPY ./VULCHAK-mai5n/. /usr/share/nginx/html/
#