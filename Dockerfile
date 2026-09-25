FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends unzip && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY offerte_app_deploy_render-3.zip /tmp/project.zip

RUN mkdir -p /tmp/project \
    && unzip -q /tmp/project.zip -d /tmp/project \
    && cp -r /tmp/project/offerte_app_progetto_finale/backend /app/backend \
    && cp -r /tmp/project/offerte_app_progetto_finale/frontend /app/frontend

WORKDIR /app/backend

RUN npm install

ENV PORT=10000

EXPOSE 10000

CMD ["npm", "start"]
