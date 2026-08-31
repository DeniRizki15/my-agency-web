FROM nginx:alpine

# 1. Hapus file default Nginx
RUN rm -rf /usr/share/nginx/html/*

# 2. Salin isi folder dist ke folder Nginx
COPY dist/ /usr/share/nginx/html/

# 3. Beri izin membaca & mengeksekusi ke seluruh folder/file web
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80
