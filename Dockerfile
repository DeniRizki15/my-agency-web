FROM nginx:alpine

# Hapus halaman default nginx
RUN rm -rf /usr/share/nginx/html/*

# Salin seluruh isi direktori website ke folder Nginx
COPY . /usr/share/nginx/html

EXPOSE 80
