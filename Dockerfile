# Utiliser l'image PHP officielle
FROM php:8.0-cli

# Installer les dépendances nécessaires pour Symfony
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    curl \
    libzip-dev \
    && docker-php-ext-install zip

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Définir le répertoire de travail
WORKDIR /app

# Copier tous les fichiers du projet dans le conteneur
COPY . .

# Installer les dépendances via Composer
RUN composer install --ignore-platform-reqs

# Exposer le port sur lequel Symfony écoutera
EXPOSE 80

# Démarrer le serveur Symfony
CMD ["php", "-S", "0.0.0.0:80", "-t", "public"]
