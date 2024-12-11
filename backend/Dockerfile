FROM node

RUN apt-get update && apt-get install -y iptables

WORKDIR /app

COPY . .

RUN npm install

RUN chmod -R 777 /app

EXPOSE 80

ENTRYPOINT ["npm", "start"]
