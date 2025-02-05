# Utiliser PHP 8.2 CLI
FROM php:8.2-cli

# Mettre à jour les sources et installer les dépendances nécessaires
RUN apt-get update && apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    unzip \
    git \
    curl \
    libzip-dev \
    libpq-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    pkg-config \
    libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install zip pdo_mysql pdo_pgsql mbstring gd intl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer self-update

# Définir le répertoire de travail
WORKDIR /app

# Copier tous les fichiers du projet dans le conteneur
COPY . .

# Fixer les permissions, en créant les répertoires si nécessaire
RUN mkdir -p /app/var /app/vendor \
    && chown -R www-data:www-data /app \
    && chmod -R 777 /app/var /app/vendor

# Nettoyer et installer les dépendances Composer
RUN composer clear-cache \
    && COMPOSER_MEMORY_LIMIT=-1 composer install --no-scripts --no-autoloader --ignore-platform-reqs --no-progress --verbose \
    && composer dump-autoload --optimize

# Exposer le port sur lequel Symfony écoutera
EXPOSE 80

# Démarrer le serveur Symfony
CMD ["php", "-S", "0.0.0.0:80", "-t", "public"]
