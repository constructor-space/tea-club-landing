FROM node:lts-slim AS build
WORKDIR /app

COPY package.json yarn.lock ./
RUN --mount=type=cache,target=/root/.yarn YARN_CACHE_FOLDER=/root/.yarn \
    yarn install --frozen-lockfile

COPY . .
RUN yarn build

FROM nginx:alpine

RUN <<EOF cat > /etc/nginx/conf.d/default.conf
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /app;

  location / {
		add_header Cache-Control "no-store";
		try_files \$uri \$uri.html \$uri/index.html /index.html;
	}

	location ~ \.(?!html) {
		add_header Cache-Control "public, max-age=2678400";
		try_files \$uri =404;
	}
}
EOF
COPY --from=build /app/dist /app
