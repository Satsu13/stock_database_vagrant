sudo yum update -y

echo "**********"
echo "**********"
echo "**********"
echo "**********"
echo "**********"
echo "INSTALLING RUBY"
echo "**********"
echo "**********"
echo "**********"
echo "**********"
echo "**********"

# install ruby
sudo yum install git -y
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.profile
source /etc/profile.d/rvm.sh
rvm install 2.3.1
rvm use 2.3.1 --default
gem install bundler
gem install rails
gem install foreman


echo "**********"
echo "**********"
echo "**********"
echo "**********"
echo "**********"
echo "INSTALLING NODE"
echo "**********"
echo "**********"
echo "**********"
echo "**********"
echo "**********"

# install node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
source ~/.bash_profile # will load in bashrc
nvm install lts/boron # v6 LTS
nvm alias default lts/boron

echo "**********"
echo "**********"
echo "**********"
echo "**********"
echo "**********"
echo "INSTALLING MYSQL"
echo "**********"
echo "**********"
echo "**********"
echo "**********"
echo "**********"

# install mysql
sudo yum install wget -y
wget http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
sudo yum localinstall mysql57-community-release-el7-9.noarch.rpm -y
# let's clean up and delete that rpm file now that its been added
rm -f mysql57-community-release-el7-9.noarch.rpm
sudo yum install mysql-community-server mysql-community-devel -y
# start mysql server
sudo service mysqld start
# start mysql on boot
sudo chkconfig mysqld on
# mysql root password is only printed to the log file so we will pull it from there and set it as a temporary variable
export MYSQL_PWD=$(sudo grep "temporary password" /var/log/mysqld.log | awk '{print $NF }')
# set root password to '~Passw0rd'
mysql --user=root --password=${MYSQL_PWD} --connect-expired-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '~Passw0rd';"
# remove env variable set
unset MYSQL_PWD

# echo "**********"
# echo "**********"
# echo "**********"
# echo "**********"
# echo "**********"
# echo "SETTING UP APP"
# echo "**********"
# echo "**********"
# echo "**********"
# echo "**********"
# echo "**********"

# setup rails app
# cd /var/www
# rails new .
# (edit gemfile)
# foreman run bundle install
# foreman run rake db:create db:migrate db:seed
# foreman run npm build
