#!/bin/bash
URL='https://www.tooplate.com/zip-templates/2129_crispy_kitchen.zip'
LOC='2129_crispy_kitchen'
ZIP='2129_crispy_kitchen.zip'
PACK='unzip wget'
TEMP='/tmp/webfile3'
yum --help &> /dev/null
if [ $? -eq 0 ]
then
	SRV='httpd'
	sudo rm -rf $TEMP
	sudo rm -rf /var/www/html/*
	echo "##########################"
	echo "start Installing packages"
	echo "##########################"
	sudo yum install $PACK $SRV -y &> /dev/null
	echo "##########################"
        echo "Packages installed"
        echo "##########################"
	sudo systemctl start $SRV
	sudo systemctl enable $SRV
	mkdir -p $TEMP
	cd $TEMP
	echo "##########################"
        echo "Downloading and unziping source code"
        echo "##########################"
	sudo wget $URL &> /dev/null
	sudo unzip $ZIP &> /dev/null
	sudo cp $LOC/* /var/www/html &> /dev/null
	sudo systemctl restart httpd
	echo "##########################"
  	echo "your website is up and running"
        echo "##########################"
	sudo rm -rf $TEMP
else
	sudo rm -rf $TEMP
	SRV='apache2'
    	sudo mv /var/www/html/* /dev/null
    	sudo apt update
	echo "##########################"
        echo "start Installing packages"
        echo "##########################"
	sudo apt install $PACK $SRV -y &> /dev/null
	echo "##########################"
        echo "Packages installed"
        echo "##########################"
    	sudo systemctl start $SRV
	sudo systemctl enable $SRV
	mkdir $TEMP
	cd $TEMP
	echo "##########################"
        echo "Downloading and unziping source code"
        echo "##########################"
	sudo wget $URL &> /dev/null
	sudo unzip $ZIP &> /dev/null 
	echo "##########################"
        echo "your website is up and running"
        echo "##########################"
	sudo cp $LOC/* /var/www/html &> /dev/null
	sudo systemctl restart $SRV
	sudo rm -rf $TEMP
fi
