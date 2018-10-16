# ADD Official python repository https://github.com/docker-library/python/blob/693a75332e8ae5ad3bfae6e8399c4d7cc3cb6181/3.4/slim/Dockerfile
FROM python:3.4
# Disable debian prompts
ENV DEBIAN_FRONTEND noninteractive
# RUN system updates
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y install binutils libproj-dev libpq-dev gdal-bin
# UPGRADE pip and setuptools
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
# INSTALL PostgreSQL
RUN apt-get install -y python-imaging python-psycopg2
RUN apt-get install -y postgresql-9.4 postgresql-client-9.4 gcc
####################################################
# setup startup script for gunicord WSGI service
####################################################
RUN groupadd webapps
RUN useradd webapp -G webapps
RUN mkdir -p /var/log/webapp/ && chown -R webapp /var/log/webapp/ && chmod -R u+rX /var/log/webapp/
RUN mkdir -p /var/run/webapp/ && chown -R webapp /var/run/webapp/ && chmod -R u+rX /var/run/webapp/
####################################################
# Install and configure supervisord
####################################################
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD ./supervisor_conf.d/webapp.conf /etc/supervisor/conf.d/webapp.conf
# ADD Project's files to the following folder
ADD lafiambrera.tar /var/projects/lafiambrera
WORKDIR /var/projects/lafiambrera
RUN pip install -r requirements.txt
# Do django-related tasks from a shell script
CMD ["sh", "./docker/docker_start.sh"]
# Open port(s)
EXPOSE 8002