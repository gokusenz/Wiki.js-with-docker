FROM base/archlinux:latest

ENV DOWNLOAD_URL https://github.com/Requarks/wiki/releases/download/v1.0.0-beta.9/wiki-js.tar.gz

RUN \
	pacman -Sy \
	&& yes | pacman --noconfirm -S ca-certificates gcc git grep make nodejs npm python2 sed wget vim \
	&& update-ca-trust \
	&& mkdir -p /var/www/wiki \
	&& mkdir -p /etc/wiki/keys \
	&& wget ${DOWNLOAD_URL} -O wiki-js.tar.gz \
	&& mv wiki-js.tar.gz /var/www/wiki \
	&& cd /var/www/wiki \
	&& tar xfz wiki-js.tar.gz \
	&& rm wiki-js.tar.gz \
	&& ln -s /usr/bin/python2 /usr/bin/python \
	&& npm install --only=production && npm rebuild

WORKDIR /var/www/wiki

EXPOSE 80
CMD ["node", "server.js"]