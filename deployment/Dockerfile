FROM ubuntu:trusty
MAINTAINER Admire Nyakudya<admire@kartoza.com>

# Use local cached debs from host (saves your bandwidth!)
# Change ip below to that of your apt-cacher-ng host
ADD 71-apt-cacher-ng /etc/apt/apt.conf.d/71-apt-cacher-ng

RUN apt-get -qq update --fix-missing && apt-get -qq --yes upgrade

RUN apt-get -y install software-properties-common wget

RUN apt-get install -y  python-virtualenv build-essential openssh-server  apache2   gcc  gdal-bin  gettext   git-core  \
    libapache2-mod-wsgi  libgeos-dev  libjpeg-dev  libpng-dev  libpq-dev  libproj-dev   libxml2-dev libxslt-dev       \
    openjdk-7-jre  patch   postgresql postgis postgresql-9.3-postgis-scripts postgresql-contrib python python-dev    \
    python-gdal  python-pycurl python-imaging  python-pastescript  python-psycopg2  python-support python-urlgrabber  \
    python-virtualenv  tomcat7  unzip  zip


WORKDIR /geonode
ADD . /geonode

RUN pip install -e /geonode
RUN paver setup

RUN useradd -m geonode

EXPOSE 8000
EXPOSE 8080

CMD ["paver", "start", "-b 0.0.0.0:8000","-f"]

