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
	sudo yum install $PACK $SRV -y &> /dev/null
	sudo systemctl start $SRV
	sudo systemctl enable $SRV
	mkdir -p $TEMP
	cd $TEMP
	sudo wget $URL &> /dev/null
	sudo unzip $ZIP &> /dev/null
	sudo cp $LOC/* /var/www/html &> /dev/null
	sudo systemctl restart httpd
	sudo rm -rf $TEMP
else
	sudo rm -rf $TEMP
	SRV='apache2'
    sudo mv /var/www/html/* /dev/null
    sudo apt update
	sudo apt install $PACK $SRV -y &> /dev/null
    sudo systemctl start $SRV
	sudo systemctl enable $SRV
	mkdir $TEMP
	cd $TEMP
	sudo wget $URL &> /dev/null
	sudo unzip $ZIP &> /dev/null 
	sudo cp $LOC/* /var/www/html &> /dev/null
	sudo systemctl restart $SRV
	sudo rm -rf $TEMP
fi
