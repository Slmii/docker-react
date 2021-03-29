# alias
FROM node:latest as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
# reference to the 'builder', copy the directory inside the 'builder' to 'nginx'
COPY --from=builder /usr/app/build /usr/share/nginx/html
