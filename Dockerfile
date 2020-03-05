FROM php:7.4.1

RUN apt-get update && apt-get install -y \
  wget \
  python-pip \
  git

RUN pecl install pcov

# USER builder
WORKDIR /home/builder

CMD ["sleep", "infinity"]
