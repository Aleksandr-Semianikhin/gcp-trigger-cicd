#! /bin/bash
………...
sudo apt update
wait 60
sudo apt install apache2 -y
wait 60
sudo systemctl start apache2
wait 60
sudo systemctl status apache2
