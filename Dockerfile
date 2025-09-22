FROM node:22-alpine

RUN npm install -g pnpm@latest

WORKDIR /app

COPY package*.json ./

RUN pnpm install --frozen-lockfile

COPY . .

RUN pnpm build

EXPOSE 8001

CMD ["pnpm", "start"]