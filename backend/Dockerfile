FROM node

RUN apt-get update && apt-get install -y iptables

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 80

ENTRYPOINT ["npm", "start"]
