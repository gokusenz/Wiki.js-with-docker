FROM node:boron-alpine


RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

# Install Wiki.js
# RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/
RUN npm install wiki.js@latest

# Run configure
#RUN node wiki configure

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
EXPOSE 3000