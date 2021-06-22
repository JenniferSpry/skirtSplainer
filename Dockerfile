# build stage
FROM node:16-buster AS build
WORKDIR /app
COPY package.json ./
RUN yarn install
COPY . .
RUN npm run build

# production stage
FROM nginx as production
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
