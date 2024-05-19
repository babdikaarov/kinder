# Creating multi-stage build for production
FROM node:18-alpine as build
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev vips-dev git > /dev/null 2>&1
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# Set environment variables
# ENV HOST=0.0.0.0 \
#     PORT=1337 \
#     APP_KEYS=RD5i9SbFHgRU5fFAF4O89g==,0K9bkUDI2KDdlvDbf2Ybtw==,sDRo9OG0LVrd3p4dTKHcGg==,mi8PrTm+hxI29GmpQY9bGA== \
#     API_TOKEN_SALT=aMqqi4260qfhHxg3C8XXbw== \
#     ADMIN_JWT_SECRET=elLC1QV1E8EKS4cXasbJnA== \
#     TRANSFER_TOKEN_SALT=2Mm2TehHXvdhoMUEc9XPaA== \
#     DATABASE_CLIENT=postgres \
#     DATABASE_PORT=5432 \
#     DATABASE_HOST=0.0.0.0 \
#     DATABASE_NAME=cms \
#     DATABASE_USERNAME=postgres \
#     DATABASE_PASSWORD=postgres \
#     DATABASE_SSL=false \
#     JWT_SECRET=oS2MxDtE+rso+P7/eOc9fQ== \
#     UNSECURE_CON=http:// \
#     SECURE_CON=https:// \
#     NODE_ENV=production



WORKDIR /opt/
COPY package.json package-lock.json ./
RUN npm install -g node-gyp
RUN npm config set fetch-retry-maxtimeout 600000 -g && npm install --only=production
ENV PATH /opt/node_modules/.bin:$PATH
WORKDIR /opt/app
COPY . .
RUN npm run build

# Creating final production image
FROM node:18-alpine
RUN apk add --no-cache vips-dev
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY --from=build /opt/node_modules ./node_modules
WORKDIR /opt/app
COPY --from=build /opt/app ./
ENV PATH /opt/node_modules/.bin:$PATH

RUN chown -R node:node /opt/app
USER node
EXPOSE 1337
CMD ["npm", "run", "start"]
