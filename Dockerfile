FROM node:lts-alpine3.20 AS base
WORKDIR /app
COPY package.json .
RUN npm install 

FROM base AS build
COPY . .
RUN npm run build

FROM base AS prod
ENV NODE_ENV=production
RUN npm install -g serve
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 reactjs
USER reactjs

COPY --from=build --chown=reactjs:nodejs /app/.build ./.build
COPY --from=build --chown=reactjs:nodejs /app/public ./public

EXPOSE 3000
CMD serve -s build


FROM node:lts-alpine3.20 AS dev
WORKDIR /app
ENV NODE_ENV=development
COPY . .
# RUN npm install 
CMD ["npm", "run", "dev"]

