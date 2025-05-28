#/app /usr /lib
FROM --platform=linux/amd64 node:19.2-alpine3.16 AS node_amd64

# cd app
WORKDIR /app

# Dest App
COPY package.json ./

# Instalar las dependencias
RUN npm install

# Dest App
COPY . .

# Realizar testing
RUN npm run test

# Eliminar archivos y directorios no nesecesarios en PRODUCCCION
RUN rm -rf test and && rm -rf node_modules

# Instalar solo las dependencias de PRODUCCION
RUN npm install --prod

# Comando run de la imagen
CMD [ "node" ,"app.js" ]

