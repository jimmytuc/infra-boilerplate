FROM phusion/baseimage:0.11

ARG ENV

ENV PATH="/opt/mssql-tools/bin:${PATH}"
ENV PYTHONPATH="${PYTHONPATH}:/datalake/"

ADD ./crontab-${ENV} /etc/crontab
ADD ./xvfb /etc/init.d/xvfb
ADD ./geckodriver /usr/local/bin/geckodriver

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y cron wget vim python3 python3-pip npm xvfb firefox mssql-tools
RUN chmod 0600 /etc/crontab
RUN chmod +x /etc/init.d/xvfb
RUN chmod +x /usr/local/bin/geckodriver
RUN pip3 install requests pandas progress elasticsearch==6.3.* selenium==3.14.1 suds3 xlrd Pillow xmljson python-firebase
RUN pip3 install google-api-python-client pytz lxml HTMLParser scrapy simplejson progressbar sklearn scipy googleads
RUN pip3 install imagetyperzapi3 oauth2client awscli cassandra-driver PyJWT fuzzywuzzy[speedup]
RUN pip3 install aiohttp
RUN npm cache clean -f && npm install -g n && n stable
RUN npm install -g elasticdump
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir -p /srv/ftp/

CMD ["/sbin/my_init"]

