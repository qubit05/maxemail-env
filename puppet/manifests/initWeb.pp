
node default {
  package {'php5-cli':}
  package {'php5':}
  package {'apache2':}


php5-curl
php5-gd
php5-cli
php5-common
php5-dev
php5-mcrypt
php5-memcache
php5-mysql
php5-sqlite
php-pear
php-apc
php5-tidy
libapache2-mod-php5

phpunit

  package {'apache2-mpm-prefork':}
  package {'apache2-prefork-dev':}
  package {'apache2-utils':}
  package {'mysql-client-5.0':}
  package {'vim-nox':}
  package {'subversion':}
  package {'memcached':}
  package {'ntp':}
  package {'jpegoptim':}
  package {'optipng':}
  package {'msttcorefonts':}
  package {'ttf-kochi-mincho':}

  stage {"pre": before => Stage["main"]}
  class {"apt": stage => "pre"}


#  phpconfig {'phpconfig': 
#    memory_limit => '128M',
#    require => Package['php5-cli']
#  }
  class mxmphp

  enable apache mod rewrite & deflate

  apache vhost
    /etc/apache2/sites-available/maxemail.conf

  enablesite
    a2ensite maxemail.conf

  notify service apache

  hostname
  memcache config
    -m 1024
    -l %internal_ip%

  add tunnel to repo
    mkdir -p -m 700 /root/.ssh
    vi config
host DevelServer
        Hostname        mail.emailcenteruk.com
        Port            41022

  additional packages
dpkg -i --force-all mail-spamassassin_2.64-1_i386.deb
ln -s /usr/share/perl/5.10.0/Mail/ /usr/share/perl/5.10/

apt-get install libqt4-webkit xvfb libgl1-mesa-dri libqt4-svg
dpkg -i cutycapt_20110127-1_amd64.deb
  
}
