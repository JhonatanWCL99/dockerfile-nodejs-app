# Imagen base que incluye npm y nodejs
FROM node:10-alpine

# Crear el directorio app y subdirectorio node_modules y cambiar de propietario a usuario node
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

#  Configurar el directorio de trabajo de la aplicación
WORKDIR /home/node/app

# Copiamos los archivos de configuracion del proyecto
COPY package*.json ./

# Nos aseguramos que todos los archivos de la aplicacion sean propiedad del usuario node
USER node

# Ejucutamos npm install para instalar las dependencias del proyecto
RUN npm install

# Copiamos el codigo fuente de la aplicacion al directorio de trabajo
COPY --chown=node:node . .

# Exponemos la aplicacion en el puerto 8080 dentro del contenedor
EXPOSE 8080

# Finalmente ejecutamos este comando para iniciar la aplicacion
CMD [ "node", "app.js" ]