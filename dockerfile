#choosing the base image a nginx for a web browse platform
FROM nginx:latest

# copying my all build artifacts from build folder and pasting in the nginx directory
COPY /build  /usr/share/nginx/html

#exposing the port value as 80
EXPOSE 80
