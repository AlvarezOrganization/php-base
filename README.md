# php-base

Imagen base de PHP de los proyectos Laravel de AlvarezOrganization:
`php:8.4-fpm-alpine` con nginx, supervisor, el cliente de MySQL y las extensiones
`pdo_mysql`, `bcmath`, `pcntl`, `opcache`, `zip`, `intl`, `gd`, `sodium` y `redis` ya compiladas.

```dockerfile
FROM ghcr.io/alvarezorganization/php-base:8.4 AS php-base
```

Compilar las extensiones en cada deploy le llevaba unos 6 minutos de CPU al servidor de
Dokploy, que además limpia el caché de build todos los días. Acá se compilan en GitHub
Actions con cada push a `main` y todos los lunes, sobre la última imagen oficial.

Etiquetas: `8.4` (la última) y `8.4-AAAAMMDD` (fija, para volver atrás).

Solo `linux/amd64`, la arquitectura del servidor. Para sumar una extensión, agregarla
acá y no en el Dockerfile de cada proyecto.

El repo es público para que el servidor baje la imagen sin credenciales.
