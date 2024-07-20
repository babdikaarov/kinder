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
         APP_KEYS: RD5i9SbFHgRU5fFAF4O89g==,0K9bkUDI2KDdlvDbf2Ybtw==,sDRo9OG0LVrd3p4dTKHcGg==,mi8PrTm+hxI29GmpQY9bGA==
         API_TOKEN_SALT: aMqqi4260qfhHxg3C8XXbw==
         ADMIN_JWT_SECRET: elLC1QV1E8EKS4cXasbJnA==
         TRANSFER_TOKEN_SALT: 2Mm2TehHXvdhoMUEc9XPaA==
         JWT_SECRET: oS2MxDtE+rso+P7/eOc9fQ==
         DATABASE_CLIENT: postgres
         DATABASE_PORT: 5432
         DATABASE_NAME: cms
         DATABASE_USERNAME: postgres
         DATABASE_PASSWORD: beksultan
         NODE_ENV: production
         # change if services names are changed test with http or https protocols
         STRAPI_ADMIN_BACKEND_URL: http://nginx
         HOST: strapi
         DATABASE_HOST: strapiDB
         PROTOCOL: http://
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
