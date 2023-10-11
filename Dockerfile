FROM oraclelinux:8 AS base

RUN dnf module enable nodejs:16 && \
    dnf module install nodejs

RUN dnf install git oracle-instantclient-release-el8 oraclelinux-developer-release-el8 && \
    dnf install node-oracledb-node16

RUN dnf clean all && \
    rm -rf /var/cache/dnf && \
    export NODE_PATH=$(npm root -g)

RUN npm i -g @nestjs/cli typescript ts-node



FROM base AS install

WORKDIR /app

COPY package*.json ./

RUN npm pkg delete scripts.prepare

# using --force to force install package oracledb 6.x.x
RUN npm ci --force



FROM install AS dev

WORKDIR /app

COPY tsconfig.json ./

ENTRYPOINT [ "npm" ]
CMD ["run", "start:dev"]



FROM install AS build

WORKDIR /app

COPY . .

# build js & remove devDependencies from node_modules
RUN npm run build && npm prune --omit=dev --force

# Migrations compiled while npm run build was call
RUN rm -rf /app/dist/migrations/*.d.ts /app/dist/migrations/*.map



FROM base AS prod

WORKDIR /app

COPY --from=build /app/dist /app/dist
COPY --from=build /app/node_modules /app/node_modules

ENTRYPOINT [ "node" ]
CMD [ "dist/main.js" ]
