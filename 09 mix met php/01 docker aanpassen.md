## Docker aanpassen

Onze docker heeft maar 2 services:
- phpmyadmin
- mariadb

maar om het met php te gebruiken hebben we meer nodig!


## docker M4Prog aanpassen

in M3Prog hadden we een docker met 4 services!


- maak een nieuwe map:
    - `M4ProgPhp-docker`
- kopieer je `M4Prog` docker-compose.yml naar die map
- pas je `docker-compose.yml` aan:
    - we voegen 2 services toe:
        ```yaml
        services:
        # PHP FPM Service
        php:
            image: wodby/php:latest
            volumes:
            - './:/var/www/html'
            depends_on:
            - mariadb

        # Nginx Service
        nginx:
            image: nginx:latest
            ports:
            - 88:80
            links:
            - 'php'
            volumes:
            - './:/var/www/html'
            - './docker/nginx:/etc/nginx/conf.d'
            depends_on:
            - php
        
        ```

## uitbreiden


- maak de juiste `folders` aan:
    - `source` (`neem` ook de files mee)
    - `docker` (`neem` ook de files mee)
    - `public` (maak deze `leeg`)

## NGinx.conf

- kopieer (uit M3Prog) of maak de nginx.conf aan
    > https://github.com/progsen/M3Prog_backend/blob/main/les-00%20docker/06_nginx_webhost_config.md


## database

- in de map waar deze file staat staat ook een `files` directory
- alles wat daarin staat zet je naast je `docker-compose.yml`


## klaar?

- commit & push naar je git