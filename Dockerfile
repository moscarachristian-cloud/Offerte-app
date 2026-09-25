FROM node:22-alpine

WORKDIR /app

RUN apk add --no-cache unzip

COPY offerte_app_deploy_render-3.zip /tmp/app.zip

RUN unzip -q /tmp/app.zip -d /app \
    && cp -r /app/offerte_app_progetto_finale/. /app/ \
    && rm -rf /app/offerte_app_progetto_finale /tmp/app.zip

WORKDIR /app/backend

RUN npm install --omit=dev

EXPOSE 8787

CMD ["npm", "start"]
