# self contained image with no volume mapping
# docker build -t otota1-node .
# docker run -p 3000:3000 otota1-node
# will successfully run standalone

FROM node:alpine
WORKDIR /usr/app
COPY package.json .
COPY index.js .
COPY ./public/ ./public/
RUN npm install --quiet
CMD [ "npm", "run", "start" ]