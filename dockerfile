FROM nginx:alpine

# Copia o arquivo index.html
COPY index.html /usr/share/nginx/html/
COPY image.png /usr/share/nginx/html/

COPY nginx.conf /etc/nginx/nginx.conf

# mudando o usuário sob o qual o processo do Nginx será executado
RUN addgroup -g 1000 -S jackexperts \
    && adduser -S -D -H -u 1000 -h /var/cache/nginx -s /sbin/nologin -G jackexperts  -g jackexperts jackexperts \
    && chown -R jackexperts:jackexperts /var/cache/nginx \
    && chown -R jackexperts:jackexperts /var/log/nginx \
    && chown -R jackexperts:jackexperts /etc/nginx/conf.d \
    && touch /var/run/nginx.pid \
    && chown -R jackexperts:jackexperts /var/run/nginx.pid

USER jackexperts

VOLUME /usr/share/nginx/html