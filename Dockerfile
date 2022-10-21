#build
FROM node:14.19.3 as build
ARG BUILD_CONTEXT

WORKDIR /fe
COPY package.json .
COPY yarn.lock .
COPY ./apps/$BUILD_CONTEXT/package.json apps/$BUILD_CONTEXT/
COPY ./apps/lib/package.json apps/lib/
RUN yarn install
COPY ./apps/$BUILD_CONTEXT apps/$BUILD_CONTEXT
COPY ./apps/lib apps/lib
RUN yarn build:$BUILD_CONTEXT

#webserver
FROM nginx:stable-alpine
ARG BUILD_CONTEXT
COPY --from=build /fe/apps/$BUILD_CONTEXT/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]