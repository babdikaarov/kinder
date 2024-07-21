# ENV config

!important please seed the data at compose file to postgress with volums (sample - strapiDB at compose file)

```yaml
volumes:
   - ./cms_data/cms_prod.sql:/docker-entrypoint-initdb.d/cms_prod.sql
   - strapiDB_data:/var/lib/postgresql/data
```

```js

// /client/next.config.mjs
     env: {
    BASE_URL: 'http://localhost', // this to prepend static assets path for metadata
    BACKEND_URL: 'https://kashkaldak.edu.kg', // backend API
    CMS_API: 'http://strapi/cms', // content API always append /cms
  },
  ....

    images: {
        ...

        remotePatterns: [
        {
            protocol: 'http',
            hostname: 'strapi',
            port: '1337',
        }, // include CMS_API address
        ],
    },


```

```yaml
// docker-compose.yaml
    ............
    ...
    ...

     environment:
         # no change
         PORT: 1337
         APP_KEYS:
         API_TOKEN_SALT:
         ADMIN_JWT_SECRET:
         TRANSFER_TOKEN_SALT:
         JWT_SECRET:
         DATABASE_CLIENT:
         DATABASE_PORT:
         DATABASE_NAME:
         DATABASE_USERNAME:
         DATABASE_PASSWORD:
         NODE_ENV:
         # change if services names are changed test with http or https protocols
         STRAPI_ADMIN_BACKEND_URL:
         HOST:
         DATABASE_HOST:
         PROTOCOL:
    ......

```

```txt

Dockeer related files

<!-- client -->
    Dockerfile - /client/Dockerfile
<!-- Strapi -->
    Dockerfile - /cms/Dockerfile
<!-- nginx -->
    Dockerfile - /nginx/Dockerfile
<!-- postgress -->
    init data => cms_prod.sql
    volums => check compose file
```
