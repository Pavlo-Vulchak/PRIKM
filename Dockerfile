FROM nginx:latest
#RUN rm -rf /usr/share/nginx/html/index.html
COPY ./VULCHAK/. /usr/share/nginx/html/
# 