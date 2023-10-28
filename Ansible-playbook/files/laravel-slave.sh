#!bin/bash

#######################################################
#######################################################

#UPDATING $ UPGRADING  THE SERVER

######################################################

sudo apt update && sudo apt upgrade -y

####################################################
####################################################

#INSTALLATION OF LAMP STACK

########################################

sudo apt-get install apache2 -y

sudo apt-get install mysql-server -y 
 
sudo add-apt-repository -y ppa:ondrej/php

sudo apt-get update

sudo apt-get install libapache2-mod-php php php-common php-xml php-mysql php-gd php-mbstring php-tokenizer php-json php-bcmath php-curl php-zip unzip -y

sudo  sed -1 's/cgi.fix_pahinfow1/cgi.fix_pathinfow0/'/etc/php/8.2/apache2/php.ini

sudo systemct1 restart apache2



##########################################################
##########################################################


#CLONE LARAVEL REPO & DEPENDENCIES 


##################################################
################################################## 



cd /var/www/html && git clone https://github.com/laravel/laravel

sudo apt install curl -y

curl -sS https://getcomposer.org/installer | php

sudo mv composer.phar /user/local/bin/composer

composer --version

cd /var/www/html/laravel && cp .env.example .env


sudo sed -i 's/DB_DATABASE=laravel/DB_DATABASE=dammy/' /var/www/html/laravel/.emv


sudo sed -i 's/DB_USERNAME=root/DB_USERNAME=dammy/' /var/www/html/laravel/.emv

sudo sed -i 's/DB_PASSWORD=/DB_DATABASE=dammy120/' /var/www/html/laravel/.emv

sudo chown -R 775 /var/www/html/laravel

sudo chmod -R 775 /var/www/html/laravel/sorage

sudo chmod -R 775 /var/www/html/laravel/bootstrap/cache



####################################################
####################################################

#CONFIGURATION OF APACHE FOR LARAVEL


##################################################


cat <<EOF > /etc/apache2/sites-available/laravel.conf
<Virtual Host *:80>
    ServerAdmin admin@example.com
    ServerName 192.168.20.11
    DocumentRoot /var/www/html/laravel/public

    <Directory /var/www/html/laravel>
    Options Indexes MultiViews FollowSymLinks
    AllowOverride All
    Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    </VirtualHost>
EOF

sudo a2enmod rewrite

sudo a2ensite laravel.conf

sudo systemct1 restart apache2


############################################################
############################################################


#CONFIGURING MYSQL: CREATING USER AND PASSWORD


###############################################################

echo "Creating MySQL user and database"
PASS=$2
if[ -z "$2"]; then
  PASS=' openssl rand -base64 8'
fi 

mysql -u root <<MYSQL_SCRIPT
CREATE DATABASE $1;
CREATE USER '$1'@'localhost' IDENTIFIED BY 'PASS';
GRANT ALL PRIVILEGES ON $1.* TO '$1'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL user and database created."
echo "Username:   $1"
echo "Database:   $1"
echo "Password:   $PASS"

###################################################################
###################################################################


#EXCUTE  


###################################################################

cd /var/www/html/laravel && php artisan key:generate

cd /var/www/html/laravel && php artisan config:cache

cd /var/www/html/laravel && php artism migrate

#####################################################################
