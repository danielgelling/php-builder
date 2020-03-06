FROM php:7.4.1

RUN apt-get update && apt-get install -y \
  wget \
  python-pip \
  git \
  zlib1g-dev \
  libzip-dev

RUN apt-get autoremove -y

RUN docker-php-ext-install zip

RUN pecl install pcov


# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
  php composer-setup.php && \
  php -r "unlink('composer-setup.php');" && \
  mv composer.phar /usr/local/bin/composer && \
  chmod ug+x /usr/local/bin/composer

USER builder
WORKDIR /home/builder

CMD ["sleep", "infinity"]
