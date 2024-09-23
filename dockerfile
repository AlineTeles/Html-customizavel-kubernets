FROM nginx:alpine

# Cria um novo usuário sem privilégios
RUN adduser -D -g 'www' nginxuser

# Copia o arquivo index.html
COPY index.html /usr/share/nginx/html/

# Ajusta as permissões para o usuário sem privilégios
RUN chown -R nginxuser /usr/share/nginx/html/

# Especifica o usuário que vai rodar o contêiner
USER nginxuser
