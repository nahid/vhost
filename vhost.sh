# Store project name in domain
domain=$1

# Get project path from user
echo 'Enter project path:'

# Store project path in projectPath
read projectPath

# Domain path
domainPath=$projectPath/$domain

# Confirm user input
echo -e "Your domain name is: $domain\nYour project path is: $projectPath\n\n"
echo "Are you sure your given info is oka ;)? Y/n"

# Store user confirmation
read confirm

if [ $confirm == n ]
then
	exit
fi

echo 'Your coffee is almost ready, please wait.... :)'

# Create project directory
sudo mkdir $domainPath
echo "$domain directory was created\n"

# Create config file
cd /etc/apache2/sites-available
sudo touch $domain.conf
sudo chmod 0777 $domain.conf
echo "<VirtualHost *:80>\n\tServerName $domain\n\tDocumentRoot $domainPath\n\tErrorLog ${APACHE_LOG_DIR}/error.log\n</VirtualHost>" > $domain.conf

echo "$domain config was created\n"

# Enabled this site
sudo a2ensite $domain

echo "$domain was enabled\n"

# Restart apache after enabling this site
# so that everything works perfectly as expected

sudo chmod -R 777 /etc/hosts
sudo echo -e "127.0.0.1 \t $domain" >> /etc/hosts

sudo service apache2 restart

echo "Congratulation, $domain successfully created. Ebar murikha"

#echo "Project name $domain and project path is: $projectPath"

# create directory at /var/www/
#sudo mkdir /var/www/$hostName

# goto apache dirctory
#cd /etc/apache2/sites-available

# create config file
#sudo touch $hostName.conf
#sudo chmod 0777 $hostName.conf

# write virtual host config
#echo -e "<VirtualHost *:80>\n\tServerName $hostName\n\tDocumentRoot /var/www/$hostName\n\tErrorLog ${APACHE_LOG_DIR}/error.log\n</VirtualHost>" > $hostName.conf

# Enabled this site
#sudo a2ensite $hostName

# Restart apache after enabling this site
# so that everything works perfectly as expected
#sudo service apache2 restart

#sudo echo -e "127.0.0.1\t$hostName" >> /etc/hosts