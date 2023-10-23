FROM node:16-alpine

WORKDIR /home/app

copy ./ ./

RUN npm install

CMD ["npm", "start"]
