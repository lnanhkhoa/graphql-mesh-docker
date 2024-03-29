
FROM node:20-alpine as mesh-min
RUN apk add git

WORKDIR /app
COPY package.json /app/package.json
COPY index.ts /app/index.ts

RUN yarn install

FROM node:20-alpine as mesh
COPY --from=mesh-min /app /app
WORKDIR /app
EXPOSE 4000
