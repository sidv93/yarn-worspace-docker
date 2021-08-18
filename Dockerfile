#build
FROM node:14.17.1 as build
ARG BUILD_APP

WORKDIR /fe
COPY package.json .
COPY yarn.lock .
COPY ./apps/$BUILD_APP/package.json apps/$BUILD_APP/
RUN yarn install
COPY . .
RUN ls
RUN yarn build:$BUILD_APP

#webserver
FROM nginx:stable-alpine
ARG BUILD_APP
COPY --from=build /fe/apps/$BUILD_APP/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]