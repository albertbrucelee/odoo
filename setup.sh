#!/bin/bash

# Tambahkan key PPA Odoo
sudo wget -O - https://nightly.odoo.com/odoo.key | sudo apt-key add -

# Tambahkan Odoo Repository
sudo echo "deb http://nightly.odoo.com/11.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list

# Update paket Sistem dan install Odoo
sudo apt-get update && apt-get install odoo

# Jalankan Odoo
sudo service odoo start
